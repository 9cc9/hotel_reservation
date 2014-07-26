module Application
  class Dispatcher
    def initialize
      @commands = {
          # :delete => Delete.new
      }
    end

    def handle_command(command_line)
      parameter = Command::ParameterFactory.new.get(command_line)
      # @commands[parameter.type].handle
      parameter.info
    end
  end
end