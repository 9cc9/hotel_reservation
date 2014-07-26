require 'yaml'
require 'singleton'

module Utils
  class Configure
    include Singleton

    BASE_PATH = HotelReservation::ROOT + '/config/'
    LOG_APPEND_PATH= 'log.yml'
    HOTEL_APPEND_PATH= 'hotels.yml'

    def log_config
      @log_config ||= get_configure(LOG_APPEND_PATH)
    end

    def hotel_config
      @hotel_config ||= get_configure(HOTEL_APPEND_PATH)
    end

    private
    def get_configure(path)
      YAML::load(File.open(BASE_PATH + path))
    rescue
      {}
    end
  end
end
