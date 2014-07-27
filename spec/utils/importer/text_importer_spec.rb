# encoding: utf-8
require 'spec_helper'

module Utils
  describe TextImporter do

    before do
      @importer = TextImporter.new
    end

    describe '#each' do
      before do
        TextImporter::DATA_BASE_PATH =  HotelReservation::ROOT + '/spec/fixtures/'
      end

      it 'should get logger configure.' do
        @importer.each do |line|
          params = line.split(':')
          expect(%w(Regular Rewards)).to include(params.first)
        end
      end
    end
  end
end