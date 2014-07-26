module Application
  class Dispatcher
    def initialize
      @commands = {
          :help => Command::Help.new,
          :reserve => Command::Reserve.new
      }
    end

    # @return [String] 输出到界面的提示信息
    def handle_command(command_line)
      parameter = Command::ParameterFactory.new.get(command_line)
      @commands[parameter.type.to_sym].handle(parameter)
    end
  end
end