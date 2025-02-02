module AirTable
  class ColumnBuilder
    REFERENCES = {
      autoNumber: AirTable::Columns::AutoNumber,
      barcode: AirTable::Columns::Barcode,
      checkbox: AirTable::Columns::Checkbox,
      createdTime: AirTable::Columns::CreatedTime,
      currency: AirTable::Columns::Currency,
      dateTime: AirTable::Columns::DateTime,
      date: AirTable::Columns::Date,
      duration: AirTable::Columns::Duration,
      email: AirTable::Columns::Email,
      formula: AirTable::Columns::Formula,
      lastModifiedBy: AirTable::Columns::LastModifiedBy,
      multipleAttachments: AirTable::Columns::MultipleAttachments,
      multipleCollaborators: AirTable::Columns::MultipleCollaborators,
      multipleSelects: AirTable::Columns::MultipleSelects,
      multilineText: AirTable::Columns::MultiLineText,
      number: AirTable::Columns::Number,
      percent: AirTable::Columns::Percent,
      phoneNumber: AirTable::Columns::PhoneNumber,
      rating: AirTable::Columns::Rating,
      richText: AirTable::Columns::RichText,
      singleCollaborator: AirTable::Columns::SingleCollaborator,
      singleLineText: AirTable::Columns::SingleSelect,
      singleSelect: AirTable::Columns::SingleSelect,
      url: AirTable::Columns::Url
    }

    class << self
      def build(data)
        type = AirTable::ColumnBuilder.find_by_type(data['type'].to_sym)

        # TODO Should we raise here? It means a field isn't supported by the library
        # maybe a warning would be better than then fall back to a generic 'Field?'
        # raise 'No Field for...' if type.nil?

        type.new(data)
      end

      def find_by_type(type)
        AirTable::ColumnBuilder::REFERENCES[type.to_sym]
      end
    end
  end
end