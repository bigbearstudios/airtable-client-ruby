module AirTable
  module Resources

    ##
    # A single record within a table
    class Record < AirTable::Resources::Resource
      def initialize(data, client, table)
        super(data, client)

        ##
        # The table to which this record belongs
        @table = table

        ##
        # The created_time, alias to created_at
        @created_time = data['createdTime']

        ##
        # The actual field values
        @attributes = build_attributes(data['fields'])
      end

      def attributes
        @attributes
      end

      private

      def build_attributes(data)

        # In theory we should only be interating over the fields which were asked for and thus could use .map
        # but this protects from the user accidentally requesting all the data and then not having the table_fields
        # to backup the mapping
        {}.tap do |built_attributes|

          # Iterate through the fields which have been provided, in theory if the mappings are correct then
          # a single field reference will be found and then an attribute can be built
          data.each do |k, v|
            column = find_table_column(k)

            built_attributes[k] = column.build_attribute(v)
          end
        end
      end

      def find_table_column(column_name)
        @table.columns.find_by_name(column_name) do |found_column|

          # Not sure what to do here, it means a column couldn't be found on our table
          # and thus the item cannot be mapped, should we error, warn or ignore?
          # raise "Unknown column: #{k}" if found_column.nil?
        end
      end
    end
  end
end