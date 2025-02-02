module AirTable
  module Attributes
    class User

      attr_reader :id, :email, :name

      def initialize(id: nil, email: nil, name: nil)
        @id = id
        @email = email
        @name = name
      end
    end
  end
end