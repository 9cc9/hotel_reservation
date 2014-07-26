module Command
  module Parameter
    class ErrorParameter < Base
      def initialize(argument)
        super(argument)
        @output = '不能识别该命令。'
      end
    end
  end
end