# 价目
module Property
  module Fee
    class Toll
      attr_reader :weekday,
                  :weekend

      def initialize(params)
        params.each { |name, value| instance_variable_set("@#{name}", value) }
      end
    end
  end
end