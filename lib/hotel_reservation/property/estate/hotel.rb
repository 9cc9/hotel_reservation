module Property
  module Estate
    class Hotel
      delegate :price,:to => :toll_station

      attr_reader :name,
                  :rating,
                  :toll_station

      def initialize(name, rating, toll_station)
        @name, @rating, @toll_station = name, rating, toll_station
      end
    end
  end
end