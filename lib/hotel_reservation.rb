require 'hotel_reservation/version'

module HotelReservation
  require 'active_support/core_ext'

  require 'hotel_reservation/utils/configure'
  require 'hotel_reservation/utils/exception/exception_methods'
  require 'hotel_reservation/utils/specification/abstract'
  require 'hotel_reservation/utils/log/record'
  require 'hotel_reservation/utils/importer/text_importer'
  require 'hotel_reservation/utils/exporter/standard_exporter'

  require 'hotel_reservation/command/helper/splitter'
  require 'hotel_reservation/command/parameter/base'
  require 'hotel_reservation/command/parameter/help_parameter'
  require 'hotel_reservation/command/parameter/reserve_parameter'
  require 'hotel_reservation/command/factory/parameter_factory'

  require 'hotel_reservation/estate/hotel'

  require 'hotel_reservation/application/dispatcher'
  require 'hotel_reservation/application/builder/interaction_builder'
  require 'hotel_reservation/application/interaction'
  LIBDIR = File.expand_path(File.dirname(__FILE__))
end

$LOAD_PATH.unshift HotelReservation::LIBDIR unless $LOAD_PATH.include? HotelReservation::LIBDIR
