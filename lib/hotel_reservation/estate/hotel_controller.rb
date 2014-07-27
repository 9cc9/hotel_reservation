module Estate
  class HotelController
    attr_reader :hotels

    def initialize(row_prices)
      @hotels = row_prices.collect do |hotel_name, prices|
        HotelBuilder.build(hotel_name, prices)
      end
    end
  end
end
