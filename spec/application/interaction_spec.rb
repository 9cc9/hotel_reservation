# encoding: utf-8
require 'spec_helper'

module Application
  READ_TIMES = 3
  class TestImporter
    def each
      Array.new(READ_TIMES) { 'help' }.each do |command_line|
        yield(command_line)
      end
    end
  end

  describe Interaction do

    before do
      @importer = TestImporter.new
      @exporter = Utils::StandardExporter.new
      @interaction = Interaction.new(@importer, @exporter, Dispatcher.new)
    end

    describe '#start' do
      it 'should read 3 line.' do
        expect(@exporter).to receive(:out).exactly(READ_TIMES).times
        @interaction.start
      end
    end
  end
end