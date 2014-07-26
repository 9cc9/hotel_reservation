
module Property
  module Fee

    # 收费站
  class TollStation
      attr_reader :tolls

      def initialize(regular_toll, reward_toll)
        @tolls = {
            :regular => regular_toll,
            :rewards => reward_toll
        }
      end

      def price(custom_type, days)

      end
    end
  end
end