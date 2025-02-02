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

      def read?
        @permission_level === 'read'
      end

      def comment?
        @permission_level === 'comment'
      end

      def edit?
        @permission_level === 'edit'
      end

      def create?
        @permission_level === 'create'
      end
    end
  end
end