# encoding: utf-8
require 'spec_helper'

module Log
  describe Record do

    describe '.logger' do
      it 'should get the same logger when request twice' do
        Record.logger.object_id.should == Record.logger.object_id
      end

      it 'should record debug message in logger.' do
        Record.logger.debug('test')
      end
    end
  end
end