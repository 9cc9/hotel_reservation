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

    describe '#get_cheapest_hotel' do
      context 'when 3 days all weekdays' do
        before do
          @parameter = Command::Parameter::ReserveParameter.
              new('reserve', 'Regular: 16Mar2009(mon), 17Mar2009(tues), 18Mar2009(wed)')
        end

        it 'get cheapest hotel is Lakewood' do
          @controller.get_cheapest_hotel(@parameter).should eq :Lakewood
        end
      end

      context 'when regular custom has 2 of 3 days is weekends' do
        before do
          @parameter = Command::Parameter::ReserveParameter.
              new('reserve', 'Regular: 20Mar2009(fri), 21Mar2009(sat), 22Mar2009(sun)')
        end

        it 'get cheapest hotel is Lakewood' do
          @controller.get_cheapest_hotel(@parameter).should eq :Bridgewood
        end
      end

      context 'when rewards custom has 2 of 3 days is weekends' do
        before do
          @parameter = Command::Parameter::ReserveParameter.
              new('reserve', 'Rewards: 26Mar2009(thur), 27Mar2009(fri), 28Mar2009(sat)')
        end

        it 'get cheapest hotel is Lakewood' do
          @controller.get_cheapest_hotel(@parameter).should eq :Ridgewood
        end
      end
    end
  end
end
