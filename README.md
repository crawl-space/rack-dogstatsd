# Rack::Dogstatsd

A Rack middleware for sending metrics to Datadog's Statsd implementation.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rack-dogstatsd'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rack-dogstatsd

## Usage

```ruby
require 'rack/dogstatsd'

use Rack::Dogstatsd
```

By default metrics are sent to `localhost:8125`

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jbowes/rack-dogstatsd.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

