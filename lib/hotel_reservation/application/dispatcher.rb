module Application
  class Dispatcher
    def initialize
      @collector = InfoCollector.new
      @commands = {
          :help => Command::Help.new,
          :reserve => Command::Reserve.new(@collector.hotel_controller)
      }
    end

    # @return [String] 输出到界面的提示信息
    def handle_command(command_line)
      parameter = Command::ParameterFactory.new.get(command_line)
      @commands[parameter.type].handle(parameter)
    end
  end
end