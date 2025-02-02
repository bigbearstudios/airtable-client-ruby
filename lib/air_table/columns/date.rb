module AirTable
  module Columns
    class Date < Column
      
      def initialize(data)
        super(data)
      end

      def build_attribute(attr_data)

        puts attr_data
        ::Date.parse(attr_data)
      end
    end
  end
end