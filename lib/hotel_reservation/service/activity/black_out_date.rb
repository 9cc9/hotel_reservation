module Service
  class BlackOutDate
    attr_reader :custom_days

    def initialize(custom_days)
      @custom_days = custom_days
    end
  end
end