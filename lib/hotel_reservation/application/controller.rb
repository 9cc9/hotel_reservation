
module Application
  class Controller
    # @param [Command::Base] command
    def handle_command(command_line)
      parameter = Command::ParameterFactory.new.get(command_line)
      p parameter.output
    end
  end
end