module Command
  module Parameter
    class Base
      attr_reader :info,
                  :type

      def initialize(type, argument)
        @type = type
      end
    end
  end
end