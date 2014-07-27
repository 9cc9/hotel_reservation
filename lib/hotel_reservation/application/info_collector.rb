module Application
  class InfoCollector
    attr_reader :hotel_info

    def initialize
      @hotel_info = Estate::HotelController.new(Utils::Configure.instance.hotel_config[:hotels])
    end
  end
end