module Estate
  class HotelController
    attr_reader :hotels

    def initialize(row_prices)
      @hotels = row_prices.collect do |hotel_name, prices|
        HotelBuilder.build(hotel_name, prices)
      end
    end

    def get_cheapest_hotel(parameter)
      hotel_prices = Hash.new.tap do |prices|
        @hotels.each do |hotel|
          prices[hotel.name] = [hotel.total_price(parameter.custom_type, parameter.days), hotel.rating]
        end
      end
      hotel_prices.sort_by { |price| price.second.last }.reverse.min_by { |v| v.second.first }.first
    end
  end
end
