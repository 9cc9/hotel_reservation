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

# {:hotels=>
#      [
#          {:Lakewood=>
#               [{"rating"=>3}, {:Regular=>[{"weekday"=>110}, {"weekend"=>90}]}, {:Rewards=>[{"weekday"=>80}, {"weekend"=>80}]}]},
#          {:Bridgewood=>[{:Regular=>[{"weekday"=>160}, {"weekend"=>60}]}, {:Rewards=>[{"weekday"=>110}, {"weekend"=>50}]}]},
#          {:Ridgewood=>[{:Regular=>[{"weekday"=>220}, {"weekend"=>150}]}, {:Rewards=>[{"weekday"=>100}, {"weekend"=>40}]}]}
#      ]}
