
module Command
  class CommandFactory
    def get(command_line)
      splitter = Helper::Splitter.new(command_line)
      Command.const_get(splitter.command_type.classify).new(splitter.argument)
    end
  end
end