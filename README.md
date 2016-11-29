# PlantUML

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'plantuml'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install plantuml

## Usage

```rb
require 'plantuml'

script = <<SCRIPT
  Alice  -> Bob : Foo
  Alice <-- Bob : Bar
SCRIPT

PlantUML.run(script)
# => #<Tempfile:/var/folders/p_/vyntvjms09g_n8c1j7rss5zw0000gp/T/20161130-52298-1a0otbq (closed)>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mizoR/plantuml.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

