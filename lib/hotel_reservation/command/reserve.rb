module Command
  class Reserve < Base
    # @param [Estate::HotelController] hotel_info
    def initialize(hotel_info)
      @hotel_info = hotel_info
    end

    def handle(parameter)
      Service::ChargeService.new(@hotel_info).get_cheapest_hotel(parameter)
    end
  end
end