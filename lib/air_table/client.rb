require 'net/http'

module AirTable
  
  ##
  # Main client to allow the access to the bases / table data
  class Client
    class InvalidAPIKey < StandardError
      def initialize(msg = 'AirTable::Client - Invalid APIKey')
        super(msg)
      end
    end

    class BaseIdOrTablesRequired < StandardError
      def initialize(msg = 'AirTable::Client - A base_id or tables param is required when calling tables')
        super(msg)
      end
    end

    def initialize(api_key)
      raise InvalidAPIKey if api_key.nil? || api_key.empty?

      @api_key = api_key

      ##
      # The cache of tables. Please see the details internal to the cache to understand the 
      # current limitations on this caching system
      @tables_cache = AirTable::Caches::TablesCache.new
    end

    ##
    # Returns a [AirTable::ResourceCollection] of [AirTable::Resources::Base] objects. By default this
    # will return a collection of all of the bases, this can be limited to 1000 only and then the offset can
    # be used to fetch another 1000 more
    # @param max_records [Boolean] 
    def bases(offset: nil, paginate: false)
      fetch_resources(AirTable::EndPoints.bases_meta, params: { offset: offset }, single_request: paginate) do |data, client|
        AirTable::Resources::Base.new(data, client)
      end
    end

    ##
    # Returns a [AirTable::Collection::Resources] of [AirTable::Resources::Table] instances. This will get all
    # of the table schemas which will be transformed into [AirTable::Resources::Table] instances, these instances
    # will have a complete structure of the internal columns and can then be used to access the resources
    # @param
    def tables(base_id)
      fetch_resources(AirTable::EndPoints.tables(base_id)) do |data, client|
        AirTable::Resources::Table.new(data, base_id, client)
      end
    end

    ##
    # Returns a [AirTable::Resources::Table] instance. This due to a limitation on
    # the API must be ran through the 'client.tables' call as the AirTable API doens't provide the functionality
    # to query a single schema
    def table(base_id, table_id, use_cache: false)
      collection = @tables_cache.find(base_id) if use_cache
      collection = tables(base_id) if collection.nil?

      collection.nil? ? nil : collection.find_by_id(table_id)
    end

    # ##
    # # Builds a table schema without querying AirTable
    # def build_table
      # Ideas for this method. It should allow you to build the schema within the code which will
      # allow for th querying of items, or possibly the building of tables as well...
    # end


    protected

        ##
    # Returns a [AirTable::ResourceCollection] which is filled with the objects returned from the AirTable API.
    # @param - single_request [Boolean] should the request be ran only once, this is a hack around some end-points not supporting maxRecords
    # 
    def fetch_resources(end_point, params: {}, single_request: false, &block)
      AirTable::Collections::Resources.new.tap do |collection|
        loop do
          response = _fetch(end_point.url, params)
          break if response.nil? # TODO How to handle no response?

          json_resources = response[end_point.reference]
          offset = response['offset']

          resources = json_resources.map { |data| block.yield(data, self) }

          collection.send(:_add_resources, resources)
          collection.send(:_set_offset, offset)
          
          # We can break from the loop if we the offset is nil / empty, there is no resources
          # the limit has been reached (and its not -1)
          break if offset.nil? || offset.empty? || resources.empty? || single_request
        end
      end
    end

    def _patch(url, body = {})
      uri = URI.parse(url)

      request = Net::HTTP::Patch.new(uri.path, headers)
      request.body = body.to_json
      response = Net::HTTP.start(uri.host, uri.port, :use_ssl => true) { |http| http.request(request) }
      
      response.status
    end

    ##
    # 
    def _put(url, body = {} )
      uri = URI.parse(url)

      request = Net::HTTP::Put.new(uri.path, headers)
      request.body = body.to_json
      response = Net::HTTP.start(uri.host, uri.port, :use_ssl => true) { |http| http.request(request) }
      
      JSON.parse(response.body)
    end

    ##
    # Fetches data using the NET::HTTP library. All errors will bubble up for the
    # developer to catch
    def _fetch(url, query_params = {})
      uri = URI.parse(url)
      uri.query = URI.encode_www_form(query_params)

      request = Net::HTTP::Get.new(uri.to_s, headers)
      response = Net::HTTP.start(uri.host, uri.port, :use_ssl => true) { |http| http.request(request) }

      JSON.parse(response.body)
    end

    def headers(optional_headers = {})
      optional_headers.merge({ 
        'Content-Type': 'application/json',
        'Authorization': "Bearer #{@api_key}"
      })
    end
  end
end