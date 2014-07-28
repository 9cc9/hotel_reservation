module Application
  class Dispatcher
    def initialize
      @collector = InfoCollector.new
      @commands = {
          :help => Command::Help.new,
          :reserve => Command::Reserve.new(@collector.hotel_info)
      }
    end

    # @return [String] Output info to viewer
    def handle_command(command_line)
      parameter = Command::ParameterFactory.new.get(command_line)
      @commands[parameter.type].handle(parameter)
    end
  end
end