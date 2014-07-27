# encoding: utf-8
require 'spec_helper'

module Estate
  describe HotelBuilder do
    before do
      row_prices = Utils::Configure.instance.hotel_config[:hotels]
      @controller = HotelController.new(row_prices)
    end

    describe '#initialize' do
      it 'should auto generate 3 hotels.' do
        @controller.hotels.size.should == 3
      end
    end
  end
end
