# encoding: utf-8
require 'spec_helper'

module Service
  module Pipe
    describe SortPipe do
      before do
        row_prices = Utils::Configure.instance.hotel_config[:hotels]
        @controller = Estate::HotelController.new(row_prices)
      end

      describe '#run' do
        before do
          @parameter = Command::Parameter::ReserveParameter.
              new('reserve', 'Rewards: 26Mar2009(thur), 27Mar2009(fri), 28Mar2009(sat)')
        end

        it 'should reverse row data.' do
          sort = Pipe::SortPipe.new(
              Pipe::ReversePipe.new(
                  Pipe::SortPipe.new(
                      Pipe::SourcePipe.new, :rating)), :total_price, @parameter.custom_type, @parameter.days)
          sort.run(@controller.hotels).first.name.should eq :Ridgewood
        end
      end
    end
  end
end
