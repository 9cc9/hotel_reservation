
module Application
  class Interaction
    def initialize(importer)
      @importer = importer
      @dispatcher = Dispatcher.new
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
      @importer.each do |command_line|
        @dispatcher.handle_command(command_line)
      end
    end
  end
end