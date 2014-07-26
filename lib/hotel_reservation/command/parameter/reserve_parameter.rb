module Command
  module Parameter
    class ReserveParameter < Base
      include Utils::ExceptionMethods
      CUSTOM_TYPES = %w(Regular Rewards).freeze

      attr_reader :custom_type,
                  :days

      def initialize(type, argument)
        super(type, argument)
        parse_argument(argument)
      end

      private
      def parse_argument(argument)
        args = argument.split(':')
        @custom_type = parse_custom_type(args[0])
        @days = parse_days(args[1])
      end

      def parse_custom_type(row_type)
        is_valid_type?(CUSTOM_TYPES.include?(row_type), row_type)
        row_type
      end

      def parse_days(row_days)
        return [] if row_days.nil? || row_days.empty? || row_days.blank?
        row_days.split(',').collect { |d| Date.parse(d) }
      rescue
        illegally_date(row_days)
      end
    end
  end
end