require 'hotel_reservation/command/parameter/parameter_factory'

module Application
  class Controller
    # @param [Command::Base] command
    def handle_command(command_line)
      parameter = Command::Parameter::ParameterFactory.new.get(command_line)
      p parameter.output
    end
  end
end