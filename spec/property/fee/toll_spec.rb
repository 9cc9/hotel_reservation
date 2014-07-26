# encoding: utf-8
require 'spec_helper'

module Property
  module Fee
    describe Toll do

      describe '#initialize' do
        before do
          @params = {:weekday => 220, :weekend => 150}
        end

        it 'should auto set value by params.' do
          @toll = Toll.new(@params)
          @toll.weekday.should eq 220
          @toll.weekend.should eq 150
        end
      end
    end
  end
end
