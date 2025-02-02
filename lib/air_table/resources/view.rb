module AirTable
  module Resources
    class Base < AirTable::Resources::Resource
      attr_reader :permission_level
      attr_accessor :name

      def initialize(data, client)
        super(data, client)

        @name = data['name'] || ''
        @permission_level = data['permissionLevel'] || 'none'
      end
    end
  end
end