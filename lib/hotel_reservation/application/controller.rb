module Application
  class Controller
    # @param [Command::Base] command
    def handle_command(command)
      parameter = ParameterFactory.new.get(command_line)
    end
  end
end