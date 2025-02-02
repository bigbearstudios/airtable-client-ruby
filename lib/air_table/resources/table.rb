module AirTable
  module Resources
    class Table < AirTable::Resources::Resource

      attr_reader :name, :description, :primary_field_id, :base_id

      def initialize(data, base_id, client)
        super(data, client)

        ##
        # The name of the table [String], should be a value
        @name = data['name']

        ##
        # The description of the table [String], can be empty
        @description = data['description'] || ''

        ##
        # The primary field id of the table, should be a value
        @primary_field_id = data['primaryFieldId']

        ##
        # The base id for which this table belongs too. It would be nicer not to need this
        # but I assume that for some reason the Table ids aren't unique across all bases
        # and this this value is needed to be send on subsequent calls
        @base_id = base_id

        ##
        # The columns (In AirTable language these are the fields)
        @columns = AirTable::Collections::Columns.new(data['fields'])
      end

      ##
      #
      def all
        @client.send(:fetch_resources, records_url) do |data, client|
          AirTable::Resources::Record.new(data, client, self)
        end
      end

      def columns
        @columns # Should this return the reference, or a deep copy...
      end

      ##
      # Updates the name or description of thr given table. These are the only avalible
      # fields which can be edited using the AirTable API
      def update_name_or_description(name: nil, description: nil)
      
        # If either of the items are set just send them across with the
        # previously set ones
        @client.send(_put, AirTable::EndPoints.table(@base_id, @id), {
          name: @name || name,
          description: @description || description
        })
        
      end

      def save
        
      end

      private

      def records_url
        @records_url ||= AirTable::EndPoints.records(@base_id, @id)
      end
    end
  end
end