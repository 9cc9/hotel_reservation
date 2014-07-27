module Estate
  module Fee
    class TollStationBuilder

      # @param [Hash] prices
      #   eg. {:regular=>{:weekday=>110, :weekend=>90}, :reward=>{:weekday=>80, :weekend=>80}}
      def self.build(prices)
        regular_toll = Toll.new(prices[:regular])
        reward_toll = Toll.new(prices[:rewards])
        TollStation.new(regular_toll, reward_toll)
      end
    end
  end
end