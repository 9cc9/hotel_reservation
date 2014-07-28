module Estate
  module Fee
    class TollStationBuilder

      # @param [Hash] prices
      #   eg. {:regular=>{:weekday=>110, :weekend=>90}, :reward=>{:weekday=>80, :weekend=>80}}
      def self.build(prices)
        TollStation.new(generate_tolls(prices))
      end

      private
      def self.generate_tolls(prices)
        {}.tap do |h|
          prices.collect do |custom_type, price|
            h[custom_type] = Toll.new(price)
          end
        end
      end
    end
  end
end