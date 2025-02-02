module AirTable
  module Collections
    class Columns
      include Enumerable

      def initialize(data)
        # TODO We should probably raise an error here
        # raise '' unless data.respond_to?(:each)
        
        @columns = data.map do |column|
          AirTable::ColumnBuilder.build(column)
        end
      end

      def find_by_id(id)
        @columns.find { |resource| resource.id === id }
      end

      def find_by_name(name)
        @columns.find { |resource| resource.name === name }
      end

      def each(&block)
        @columns.each(&block)
      end
    end
  end
end