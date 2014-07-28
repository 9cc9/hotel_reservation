# encoding: utf-8
require 'spec_helper'

module Command
  describe Reserve do
    before do
      row_prices = Utils::Configure.instance.hotel_config[:hotels]
      @controller = Estate::HotelController.new(row_prices)
      @reserve = Reserve.new(@controller)
    end

    describe '#handle' do
      before do
        @parameter = Parameter::ReserveParameter.new('reserve', 'Regular: 16Mar2009(mon), 17Mar2009(tues), 18Mar2009(wed)')
      end

      it 'should get final results.' do
        @reserve.handle(@parameter).should eq :Lakewood
      end
    end
  end
end
