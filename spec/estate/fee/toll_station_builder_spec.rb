# encoding: utf-8
require 'spec_helper'

module Estate
  module Fee
    describe TollStationBuilder do

      describe '.build' do
        before do
          @prices = {:regular => {:weekday => 110, :weekend => 90}, :rewards => {:weekday => 80, :weekend => 80}}
        end

        it 'should auto set value by params.' do
          toll_station = TollStationBuilder.build(@prices)
          toll_station.tolls[:regular].class.should eq Toll
          toll_station.tolls[:rewards].class.should eq Toll
        end
      end
    end
  end
end
