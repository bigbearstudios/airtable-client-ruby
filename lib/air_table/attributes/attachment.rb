module AirTable
  module Attributes
    class Attachment

      attr_reader :id, :url, :filename, :size, :type

      def initialize(id: nil, url: nil, filename: nil, size: nil, type: nil)
        @id = id
        @url = url
        @filename = filename
        @size = size
        @type = type
      end
    end
  end
end