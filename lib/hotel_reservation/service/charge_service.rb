module Service
  class ChargeService
    def initialize(hotel_info)
      @hotel_info = hotel_info
    end

    def get_cheapest_hotel(parameter)
      hotel_prices = Hash.new.tap do |prices|
        @hotel_info.hotels.each do |hotel|
          prices[hotel.name] = [hotel.total_price(parameter.custom_type, parameter.days), hotel.rating]
        end
      end
      hotel_prices.sort_by { |price| price.second.last }.reverse.min_by { |v| v.second.first }.first
    end
  end
end