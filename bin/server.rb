#!/usr/bin/env ruby

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'hotel_reservation'

interaction = Application::InteractionBuilder.build
interaction.start