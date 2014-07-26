module Command
  module Helper

    # Convert input line to type and argument
    class Splitter
      attr_reader :command_type,
                  :argument

      def initialize(line)
        case line
          when 'quit', 'help'
            @command_type = line
            @argument = ''
          when /^Regular/, /^Rewards/
            @command_type = 'reserve'
            @argument = line
          else
            @command_type = 'error'
            @argument = ''
        end
      end
    end
  end
end