require 'hotel_reservation/command/parameter/parameter_factory'

module Application
  class Interaction
    def initialize
      @controller = Controller.new
    end

    def start
      run
    rescue Interrupt
      Log::Record.logger.info "[#{Thread.current}] ReservationServer exits by interrupt."
    rescue SignalException
      Log::Record.logger.info "[#{Thread.current}] ReservationServer exits by signal."
    end

    private
    def run
      while command_line = gets
        Log::Record.logger.debug "From stdin: #{command_line}"
        break if 'quit'.eql?(command_line)
        @controller.handle_command(parameter)
      end
    end
  end
end