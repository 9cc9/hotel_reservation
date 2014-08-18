# encoding: utf-8
require 'spec_helper'

module Estate
  describe HotelBuilder do
    before do
      @name = :Ridgewood
      @arguments = {:rating => 5,
                    :regular => {:weekday => 220, :weekend => 150},
                    :rewards => {:weekday => 100, :weekend => 40}}
    end

    describe '#total_price' do
      before do
        @hotel = HotelBuilder.build(@name, @arguments)
        @custom_days = {
            :regular => [Date.parse('16Mar2009'), Date.parse('17Mar2009'), Date.parse('22Mar2009')],
            :rewards => [Date.parse('16Mar2010')]
        }
      end

      it 'should get total price.' do
        @hotel.total_price(@custom_days).should == 690
      end
    end
  end
end
