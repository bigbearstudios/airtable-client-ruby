module AirTable
  module Columns
    class MultipleCollaborators < Column
      

      ##
      # Builds a [AirTable::Attributes::User[]] attribute using the
      # data passed
      def build_attribute(data)
        data.map do |d|
          AirTable::Attributes::User.new(
            id: d['id'],
            name: d['name'],
            email: d['email']
          )
        end
      end
    end
  end
end