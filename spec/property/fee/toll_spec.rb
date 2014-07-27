# encoding: utf-8
require 'spec_helper'

module Property
  module Fee
    describe Toll do
      before do
        @params = {:weekday => 220, :weekend => 150}
      end

      describe '#initialize' do
        it 'should auto set value by params.' do
          @toll = Toll.new(@params)
          @toll.weekday.should eq 220
          @toll.weekend.should eq 150
        end
      end

      describe '#price' do
        before do
          @toll = Toll.new(@params)
        end

        it 'should get weekday prices of wed.' do
          @toll.price(3).should eq 220
        end

        it 'should get workday prices of sun.' do
          @toll.price(0).should eq 150
        end
      end
    end
  end
end
