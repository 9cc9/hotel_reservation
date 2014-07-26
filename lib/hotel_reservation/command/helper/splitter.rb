module Command
  module Helper

    # Convert input line to type and argument
    class Splitter
      attr_reader :command_type,
                  :argument

      def initialize(line)
        case line
          when 'help'
            @command_type = "#{line}_parameter"
            @argument = ''
          when /^Regular/, /^Rewards/
            @command_type = 'reserve_parameter'
            @argument = line
          else
            @command_type = 'error_parameter'
            @argument = ''
        end
      end
    end
  end
end