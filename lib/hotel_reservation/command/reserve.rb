module Command
  class Reserve < Base
    # @param [Property::Estate::HotelController] hotel_controller 宾馆信息
    def initialize(hotel_controller)
      @hotel_controller = hotel_controller
    end

    def handle(parameter)
      @hotel_controller.get_cheapest_hotel(parameter)
    end
  end
end