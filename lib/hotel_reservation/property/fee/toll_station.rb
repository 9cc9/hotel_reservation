# 收费站

module Property
  module Fee
    class TollStation
      attr_reader :regular_toll,
                  :reward_toll

      def initialize(regular_toll, reward_toll)
        @regular_toll, @reward_toll = regular_toll, reward_toll
      end
    end
  end
end