module Property
  module Estate
    class Hotel
      attr_reader :name,
                  :rating,
                  :toll_station

      def initialize(name, rating, toll_station)
        @name, @rating, @toll_station = name, rating, toll_station
      end

    end
  end
end