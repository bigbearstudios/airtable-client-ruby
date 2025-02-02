module AirTable
  module Caches
    ##
    # A simple table cache based on the ruby Hash. This has limitations in terms of
    # a multi-threaded environment, this can be addressed in a later release
    class TablesCache

      def initialize
        @cache = {}
      end

      def add(base_id, collection)
        @cache[base_id] = collection
      end

      def find(base_id)
        @cache[base_id]
      end
    end
  end
end