module Service
  module Builder
    class ChargeServiceBuilder
      def self.build(hotel_info)
        ChargeService.new(hotel_info)
      end
    end
  end
end
