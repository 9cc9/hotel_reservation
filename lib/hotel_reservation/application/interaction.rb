module Application
  class Interaction
    def initialize(importer, exporter, dispatcher)
      @importer, @exporter, @dispatcher = importer, exporter, dispatcher
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
        begin
          @exporter.out @dispatcher.handle_command(command_line)
        rescue => e
          @exporter.out e.message
        end
      end
    end
  end
end