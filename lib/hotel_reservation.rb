require "hotel_reservation/version"

module HotelReservation
  require 'active_support/core_ext'

  require 'hotel_reservation/utils/configure'
  require 'hotel_reservation/log/record'

  require 'hotel_reservation/command/helper/splitter'
  require 'hotel_reservation/command/base_command'
  require 'hotel_reservation/command/error'
  require 'hotel_reservation/command/help'
  require 'hotel_reservation/command/quit'
  require 'hotel_reservation/command/reserve'
  require 'hotel_reservation/command/command_factory'

  require 'hotel_reservation/estate/hotel'
  LIBDIR = File.expand_path(File.dirname(__FILE__))
end

$LOAD_PATH.unshift HotelReservation::LIBDIR unless $LOAD_PATH.include? HotelReservation::LIBDIR
