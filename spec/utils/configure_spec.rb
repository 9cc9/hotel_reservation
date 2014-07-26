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

  end
end