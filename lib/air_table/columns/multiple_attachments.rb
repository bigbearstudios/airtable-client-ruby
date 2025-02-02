module AirTable
  module Columns
    class MultipleAttachments < Column
      
      def build_attribute(data)
        data.map do |d|
          AirTable::Attributes::Attachment.new(
            id: d['id'],
            url: d['url'],
            filename: d['filename'],
            size: d['size'],
            type: d['type']
          )
        end
      end
    end
  end
end