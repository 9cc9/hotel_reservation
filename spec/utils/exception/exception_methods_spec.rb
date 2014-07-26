# encoding: utf-8
require 'spec_helper'

module Utils
  describe ExceptionMethods do
    class DummyException
    end

    before do
      @dummy = DummyException.new
      @dummy.extend(ExceptionMethods)
    end

    describe '#must_be_implemented' do
      it 'should throw NotImplementedError.' do
        expect { @dummy.must_be_implemented(:method) }.to raise_error(NotImplementedError)
      end
    end
  end
end