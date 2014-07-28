# encoding: utf-8
require 'spec_helper'

module Utils
  describe StandardExporter do

    before do
      @exporter = StandardExporter.new
    end

    describe '#out' do

      it 'should direct call puts.' do
        expect(@exporter).to receive(:out)
        @exporter.out('INFO')
      end
    end
  end
end