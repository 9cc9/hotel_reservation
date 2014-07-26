# encoding: utf-8
require 'spec_helper'

module Command
  module Helper
    describe Splitter do

      describe '#initialize' do

        context 'when input command is help' do
          before do
            @splitter = Splitter.new('help')
          end

          it 'should get command type is help.' do
            @splitter.command_type.should == 'help'
          end

          it 'should get empty argument.' do
            @splitter.argument.should == ''
          end
        end

        context 'when input command is reserve' do
          before do
            @splitter = Splitter.new('Rewards: 20Mar2009(fri), 21Mar2009(sat), 22Mar2009(sun)')
          end

          it 'should get command type is reserve.' do
            @splitter.command_type.should == 'reserve'
          end

          it 'should get arguments.' do
            @splitter.argument.should == 'Rewards: 20Mar2009(fri), 21Mar2009(sat), 22Mar2009(sun)'
          end
        end

        context "when input command line can't parsed" do
          it 'should get exception.' do
            expect { Splitter.new('UnknownMessage') }.to raise_error(Utils::ExceptionMethods::IllegalInputError)
          end
        end
      end
    end
  end
end
