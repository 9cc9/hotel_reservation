module Command
  module Helper

    # Convert input line to type and argument
    class Splitter
      attr_reader :command_type,
                  :argument

      def initialize(line)
        command_line = line.chomp
        case command_line
          when 'help'
            @command_type = "#{command_line}_parameter"
            @argument = ''
          when /^Regular/, /^Rewards/
            @command_type = 'reserve_parameter'
            @argument = command_line
          else
            @command_type = 'error_parameter'
            @argument = ''
        end
      end
    end
  end
end