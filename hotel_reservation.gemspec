# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hotel_reservation/version'
require 'rake'

Gem::Specification.new do |spec|
  spec.name          = "hotel_reservation"
  spec.version       = HotelReservation::VERSION
  spec.authors       = ["9cc9"]
  spec.email         = ["cyx199021@163.com"]
  spec.description   = %q{Hotel reservation}
  spec.summary       = %q{Help online customer find the cheapest hotel.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = FileList['lib/**/*.rb', 'lib/hotel_reservation.rb', 'spec/**/*', 'config/*'].to_a
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", '~> 3.0'
end
