module AirTable
  module Collections
    class Resources
      include Enumerable

      attr_reader :offset

      def initialize

        ##
        # The collection of resources
        @resources = []

        ##
        # The last known offset which was used to get these resources
        @offset = nil
      end

      def each(&block)
        @resources.each(&block)
      end

      def find_by_id(id)
        @resources.find { |resource| resource.id === id }
      end

      private

      ##
      # Adds resouces into the resource collection.
      # 
      # Warning. This is an internal method
      def _add_resources(resources)
        @resources.push(*resources)
      end

      ##
      # Sets the offset. This will transform the offset into false if its nil?, otherwise will set
      # the offset.
      # Warning. This is an internal method
      def _set_offset(offset)
        @offset = (offset.nil? || offset.empty?) ? false : offset
      end
    end
  end
end