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
      while command = gets
        puts "From stdin: #{command}"
        @controller.handle_command(command)
      end
    end
  end
end