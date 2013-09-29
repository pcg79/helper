# Helper

Helper is a bot built to be helpful.

## Installation

Add this line to your application's Gemfile:

    gem 'helper'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install helper

## Usage

1. Install gem
2. `helper new`
3. Edit the Gemfile
4. Edit the config.yml
5. `helper run`

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

### Design Notes ###

* Tinder for campfire connection
* Each room gets a celluloid actor (`Thing.new(room).listen!`)
* Each message received gets a call to Router, with the room instance and the message
* Router matches the registered handlers (attachements?), and calls it with the room and message matches
* Response sent right back to the room (using speak or upload or whatever)
* Supervisor process manages and restarts actors as they fail
* Shutdown messages call stop_listening on each room

### Questions ###

* Tinder uses EventMachine, can we run it inside of an actor>

### Dreams ###

* Chainable messages
* Abstract the connections to use IRC, flowdock, hipchat, websocket
* Middlewares to transform messages (message is JSON string, parse and operate on a hash)
* Bridge/link between multiple chat protocols?
