# 价目
module Estate
  module Fee
    class Toll
      attr_reader :weekday, # work day
                  :weekend

      def initialize(params)
        params.each { |name, value| instance_variable_set("@#{name}", value) }
      end

      # @param [Integer] wday the day of week (0-6, Sunday is zero).
      def price(wday)
        workdays = *(1..5)
        if workdays.include?(wday)
          return @weekday
        end
        @weekend
      end
    end
  end
end