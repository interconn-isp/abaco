# Abaco

Abaco is a Ruby library for converting numbers into Italian words.

It was specifically developed for the generation of postal payment slips via our
[Bollettino](https://github.com/interconn-isp/bollettino) gem. Initially, Abaco
was part of the gem, then we decided to extract the functionality.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'abaco'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install abaco

## Usage

```ruby
15.to_italian # <= "quindici"
15.5.to_italian # <= "quindici/5"
```

## Contributing

1. Fork it (https://github.com/interconn-isp/abaco/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Related projects

The [Bollettino](https://github.com/interconn-isp/bollettino) gem can be used
with Abaco to generate Italian postal payment slips.

## Maintainers

Abaco is developed and maintained by [Alessandro Desantis](https://github.com/alessandro1997).

## License

Abaco is released under the MIT license.

[![InterConn](http://www.gravatar.com/avatar/b3f5893b97323096977545477e0066c5.jpg?s=100)](http://www.interconn.it)
