module Estate
  class HotelBuilder
    # From configure
    def self.build(name, arguments)
      rating = arguments[:rating]
      toll_station = Fee::TollStationBuilder.build(extract_arguments(arguments))
      Hotel.new(name, rating, toll_station)
    end

    private
    def self.extract_arguments(arguments)
      arguments.tap { |a| a.delete(:rating) }
    end
  end
end
