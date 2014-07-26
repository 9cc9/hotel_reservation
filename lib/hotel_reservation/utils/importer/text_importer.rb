module Utils
  class TextImporter
    BASE_PATH = HotelReservation::ROOT + '/resources/'
    DATA_APPEND_PATH= 'data'

    def each
      File.open(BASE_PATH + DATA_APPEND_PATH).each_line do |line|
        yield(line.chomp)
      end
    end
  end
end
