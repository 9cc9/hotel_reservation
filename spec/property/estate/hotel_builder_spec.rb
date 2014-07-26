# encoding: utf-8
require 'spec_helper'

module Property
  module Estate
    describe HotelBuilder do

      describe '.build' do
        before do
          @name = :Ridgewood
          @arguments = {:rating => 5,
                        :regular => {:weekday => 220, :weekend => 150},
                        :rewards => {:weekday => 100, :weekend => 40}}
        end

        it 'should auto set value by params.' do
          hotel = HotelBuilder.build(@name, @arguments)
          hotel.name.should eq :Ridgewood
          hotel.rating.should eq 5
        end
      end
    end
  end
end
