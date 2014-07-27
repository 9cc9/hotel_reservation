module Application
  class InfoCollector
    attr_reader :hotel_controller

    def initialize
      @hotel_controller = Property::Estate::HotelController.new(Utils::Configure.instance.hotel_config[:hotels])
    end
  end
end