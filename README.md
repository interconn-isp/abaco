# Abaco

[![Build Status](https://travis-ci.org/interconn-isp/abaco.svg?branch=master)](https://travis-ci.org/interconn-isp/abaco)
[![Dependency Status](https://gemnasium.com/interconn-isp/abaco.svg)](https://gemnasium.com/interconn-isp/abaco)
[![Code Climate](https://codeclimate.com/github/interconn-isp/abaco/badges/gpa.svg)](https://codeclimate.com/github/interconn-isp/abaco)

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

Abaco extends the `Numeric` class, so you can use with `Fixnum` and `Float`:

```ruby
15.to_italian # <= "quindici/00"
15.5.to_italian # <= "quindici/50"
```

You can also call the convert directly:

```ruby
Abaco::Converter.convert(15) # <= "quindici/00"
Abaco::Converter.convert(15.5) # <= "quindici/50"
```

## Limitations

Presently, the biggest number Abaco can translate is **999.999.999.999**. Since
this library is mainly meant to be used for billing purposes, we didn't find it
necessary to go beyond that limit.

If you're billing someone for one trillion, contact us right away: we'll be glad
to help you! :)

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
