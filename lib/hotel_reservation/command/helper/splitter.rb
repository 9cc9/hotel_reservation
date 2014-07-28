module Command
  module Helper

    # Convert input line to type and argument
    class Splitter
      include Utils::ExceptionMethods

      attr_reader :command_type,
                  :argument

      # TODO: /^\[([A-Z_a-z]*)\]/.match(line)
      def initialize(line)
        case line
          when 'help'
            @command_type = line
            @argument = ''
          when /^Regular/, /^Rewards/
            @command_type = 'reserve'
            @argument = line
          else
            illegally_spelling(line)
        end
      end
    end
  end
end