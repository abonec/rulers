# Rulers

A research project to study of building web framework

## Installation

Add this line to your application's Gemfile:

    gem 'rulers'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rulers

## Usage

Not have any generators at now.
Need to inherit your application from Rulers::Application and and add it to rackup config file, e.g.:

File ``config/application.rb``:

    module YourApp
      class Application < Rulers::Application

      end
    end

File ``config.ru``:

    require ::File.expand_path '../config/application', __FILE__
    run BestQuotes::Application.new

And then ``rackup`` in this foler

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
