# HotelReservation

Help online customer find the cheapest hotel.

Interaction is the main class to run, which get data from importer. 

Import data from /resources/data, and parse it to a suitable parameter.

Then, special parameter is distributed by command pattern, it will trigger matched service to run.

Finally, service generate response to viewer.

## Installation

Into directory of this gem, and then execute:

    $ bundle install

## Usage

    $ ruby bin/server.rb

### Configuration

The following is a partial list of the keys that are read from the YAML file:

* `hotels` - an array of hotel information, you can configure hotel basic info by this file.
* `log` - a basic configure of log level and file location.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
