# encoding: utf-8
require 'spec_helper'

module Estate
  module Fee
    describe TollStation do
      before do
        prices = {:regular => {:weekday => 110, :weekend => 90}, :rewards => {:weekday => 80, :weekend => 70}}
        @toll_station = TollStationBuilder.build(prices)
      end

      describe '#total_price' do
        before do
          @days = [Date.parse('16Mar2009'), Date.parse('17Mar2009'), Date.parse('22Mar2009')]
        end

        it 'should get total prices of days.' do
          @toll_station.total_price(:regular, @days).should eq 110*2+90
        end

        context 'when all weekend days' do
          before do
            @days = [Date.parse('21Mar2009'), Date.parse('29Mar2009'), Date.parse('22Mar2009')]
          end

          it 'should get all prices of weekends.' do
            @toll_station.total_price(:rewards, @days).should eq 70*3
          end
        end

      end
    end
  end
end
