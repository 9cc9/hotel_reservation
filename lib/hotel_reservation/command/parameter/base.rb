module Command
  module Parameter
    class Base
      attr_reader :output,
                  :type

      def initialize(type, argument)
        @type = type
      end
    end
  end
end