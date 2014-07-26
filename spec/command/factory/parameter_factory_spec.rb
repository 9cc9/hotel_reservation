# encoding: utf-8
require 'spec_helper'

module Command
  describe ParameterFactory do
    before do
      @factory = ParameterFactory.new
    end

    describe '#get' do
      context 'when command_line is help' do
        it 'should get Command::Help instance.' do
          help_argument = 'help'
          command = @factory.get(help_argument)
          command.class.should == Command::Parameter::HelpParameter
        end
      end

      context 'when command_line is unknown' do
        it 'should get Command::Error instance.' do
          unknown_argument = 'UnknownMessage'
          expect { @factory.get(unknown_argument) }.to raise_error(Utils::ExceptionMethods::IllegalInputError)
        end
      end
    end
  end
end
