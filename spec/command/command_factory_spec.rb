# encoding: utf-8
require 'spec_helper'

module Command
  describe CommandFactory do
    before do
      @factory = CommandFactory.new
    end

    describe '#get' do
      context 'when command_line is quit' do
        it 'should get Command::Quit instance.' do
          quit_argument = 'quit'
          command = @factory.get(quit_argument)
          command.class.should == Command::Quit
        end
      end

      context 'when command_line is unknown' do
        it 'should get Command::Quit instance.' do
          unknown_argument = 'UnknownMessage'
          command = @factory.get(unknown_argument)
          command.class.should == Command::Error
        end
      end
    end
  end
end
