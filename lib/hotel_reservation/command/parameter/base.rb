module Command
  module Parameter
    class Base
      attr_reader :info,
                  :type

      def initialize(type, argument)
        @type = type.to_sym
      end
    end
  end
end