# frozen_string_literal: true

module AirTable
  class Endpoint
    attr_reader :url, :reference

    def initialize(reference, url)
      @url = url
      @reference = reference
    end
  end

  class EndPoints
    class << self
      #
      # The bases url, supports GET, POST
      def bases_meta
        AirTable::Endpoint.new(
          'bases',
          'https://api.airtable.com/v0/meta/bases'
        )
      end

      def views(base_id)
        AirTable::Endpoint.new(
          'views',
          "https://api.airtable.com/v0/meta/bases/#{base_id}/views"
        )
      end

      def tables(base_id)
        AirTable::Endpoint.new(
          'tables',
          "https://api.airtable.com/v0/meta/bases/#{base_id}/tables"
        )
      end

      def table(base_id, table_id)
        AirTable::Endpoint.new(
          nil,
          "https://api.airtable.com/v0/meta/bases/#{base_id}/tables/#{table_id}"
        )
      end

      def records(base_id, table_id)
        AirTable::Endpoint.new(
          'records',
          "https://api.airtable.com/v0/#{base_id}/#{table_id}"
        )
      end
    end
  end
end