module Estate
  module Fee

    class TollStation
      attr_reader :tolls

      def initialize(regular_toll, reward_toll)
        @tolls = {
            :regular => regular_toll,
            :rewards => reward_toll
        }
      end

      def total_price(custom_type, days)
        days.sum do |day|
          @tolls[custom_type].price(day.wday)
        end
      end
    end
  end
end