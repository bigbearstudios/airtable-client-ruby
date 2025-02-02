module AirTable
  module Columns
    class SingleCollaborator < Column
      
      ##
      # Builds a AirTable::Attributes::User attribute using the
      # data passed
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