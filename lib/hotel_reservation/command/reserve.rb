module Command
  class Reserve < Base
    # @param [Property::Estate::HotelController] hotel_info 宾馆信息
    def initialize(hotel_info)
      @hotel_info = hotel_info
    end

    def handle(parameter)
      service = Service::Builder::ChargeServiceBuilder.build(@hotel_info)
      service.handle
      parameter.info
    end
  end
end