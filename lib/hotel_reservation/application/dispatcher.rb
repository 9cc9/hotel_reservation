
module Application
  class Dispatcher
    def initialize
      @commands = {
      }
    end

    def handle_command(command_line)
      parameter = Command::ParameterFactory.new.get(command_line)
      # @commands[parameter.type].handle
      p parameter.output
    end
  end
end