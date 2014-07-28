# encoding: utf-8
require 'spec_helper'

module Utils
  describe Abstract do
    describe '.abstract_methods' do
      before do
        @klass = Class.new do
          include Abstract
          abstract_methods :foo, :bar
        end
      end

      it 'raises NotImplementedError.' do
        proc {
          @klass.new.foo
        }.should raise_error(NotImplementedError)
      end

      it 'can be overridden.' do
        subclass = Class.new(@klass) do
          def foo(arg1)
            arg1
          end
        end

        subclass.new.foo(1).should == 1
      end
    end
  end
end