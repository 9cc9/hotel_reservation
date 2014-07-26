module Application
  class Controller
    def handle_command(command)
      Command::CommandFactory.new.get(command)

    end
  end
end