module Command
  module Parameter
    class ErrorParameter < Base
      def initialize(type, argument)
        super(type, argument)
        @info = '不能识别该命令。'
      end
    end
  end
end