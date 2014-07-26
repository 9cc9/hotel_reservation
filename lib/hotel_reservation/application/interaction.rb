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
      while line = gets
        Log::Record.logger.debug "From stdin: #{line}"
        break if 'quit'.eql?(line.chomp) || 'exit'.eql?(line.chomp)
        @controller.handle_command(line)
      end
    end
  end
end