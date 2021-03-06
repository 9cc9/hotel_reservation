# encoding: utf-8
require 'spec_helper'

module Application
  describe Dispatcher do

    before do
      @dispatcher = Dispatcher.new
    end

    describe '#handle_command' do
      before do
        @command_line = 'help'
      end

      it 'should match handler.' do
        expect(@dispatcher.instance_variable_get(:@commands)[:help]).to receive(:handle)
        @dispatcher.handle_command(@command_line)
      end
    end
  end
end