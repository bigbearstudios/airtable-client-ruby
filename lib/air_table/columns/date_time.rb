module AirTable
  module Columns
    class DateTime < Column
      

      def build_attribute(attr_data)
        ::DateTime.parse(attr_data)
      end
    end
  end
end