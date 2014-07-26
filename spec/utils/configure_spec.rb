# encoding: utf-8
require 'spec_helper'

module Utils
  describe Configure do

    before do
      @configure = Configure.instance
    end

    describe '#log_config' do
      it 'should get logger configure.' do
        @configure.log_config[:file_name].should == 'log/log'
      end
    end

    describe '#hotel_config' do
      it 'should get configure of hotels.' do
        @configure.hotel_config[:hotels].size.should == 3
        # @configure.hotel_config[:hotels].each do |key, value|
        #   p key
        #   p value
        # end
      end
    end
  end
end