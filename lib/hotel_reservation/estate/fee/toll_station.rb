module Estate
  module Fee

    class TollStation
      # [Hash]:regular, :rewards
      attr_reader :tolls

      def initialize(tolls)
        @tolls = tolls
      end

      def total_price(custom_type, days)
        days.sum do |day|
          @tolls[custom_type].price(day.wday)
        end
      end
    end
  end
end