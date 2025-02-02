module AirTable
  module Resources
    class Resource
      attr_reader :id

      ##
      #
      def initialize(data, client)
        @id = data['id']
        @client = client
      end

      def persisted?
        !@id.nil?
      end
    end
  end
end