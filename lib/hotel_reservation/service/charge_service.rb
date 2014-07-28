module Service
  class ChargeService
    def initialize(hotel_info)
      @hotel_info = hotel_info
    end

    def get_cheapest_hotel(parameter)
      sorted_hotels = generate_pipe(parameter).run(@hotel_info.hotels)
      sorted_hotels[0].name
    end

    private
    def generate_pipe(parameter)
      Pipe::SortPipe.new(
          Pipe::ReversePipe.new(
              Pipe::SortPipe.new(
                  Pipe::SourcePipe.new, :rating)), :total_price, parameter.custom_type, parameter.days)
    end
  end
end