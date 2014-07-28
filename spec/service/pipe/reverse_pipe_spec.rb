# encoding: utf-8
require 'spec_helper'

module Service
  module Pipe
    describe ReversePipe do
      before do
        row_prices = Utils::Configure.instance.hotel_config[:hotels]
        @controller = Estate::HotelController.new(row_prices)
      end

      describe '#run' do
        before do
          @parameter = Command::Parameter::ReserveParameter.
              new('reserve', 'Regular: 16Mar2009(mon), 17Mar2009(tues), 18Mar2009(wed)')
        end

        it 'should reverse row data.' do
          sort = Pipe::SortPipe.new(
              Pipe::ReversePipe.new(
                  Pipe::SortPipe.new(
                      Pipe::SourcePipe.new, :rating)), :total_price, @parameter.custom_type, @parameter.days)
          sort.run(@controller.hotels).first.name.should eq :Lakewood
        end
      end
    end
  end
end
