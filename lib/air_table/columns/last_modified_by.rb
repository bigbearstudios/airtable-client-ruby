module AirTable
  module Columns
    class LastModifiedBy < Column

      
      def build_attribute(data)
        AirTable::Attributes::User.new(
          id: data['id'],
          name: data['name'],
          email: data['email']
        )
      end
    end
  end
end