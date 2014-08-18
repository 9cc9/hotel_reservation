# encoding: utf-8
require 'spec_helper'

module Service
  describe BlackOutService do
    before do
      @service = BlackOutService.new
    end

    describe '#convert' do
      before do
        @parameter = ReserveParameter.new('reserve', 'Regular: 16Mar2009(mon), 17Mar2009(tues), 18Mar2009(wed)')
      end


      it 'should convert parameter do black out days.' do
        @service.convert(@parameter).should =={
            :regular => [Date.parse('16Mar2009'), Date.parse('17Mar2009'), Date.parse('22Mar2009')],
            :rewards => [Date.parse('16Mar2010')]
        }
      end
    end
  end
end
