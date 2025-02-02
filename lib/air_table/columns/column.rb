module AirTable
  module Columns

    ##
    # The representation of an AirTable Field.
    class Column
      attr_reader :id, :name

      def initialize(data)
        ##
        # The id of the column. This is the AirTable id
        @id = data['id']

        ##
        #
        @name = data['name']

        ##
        # The type of the column. This is AirTables own type definition. The mappings
        # for these definitions to our Column instances can be found in AirTable::FieldBuilder
        @type = data['type']
      end

      ##
      # Builds the attribute, which acts as the storage instance for a given column. The basic attribute
      # creation just forced anything sent across as the value itself.
      # Developer Notes.
      # Should it be just the value? Do we need any extra functionality which would be better defined in a
      # boxed type?
      def build_attribute(attr_data)
        attr_data
      end
    end
  end
end