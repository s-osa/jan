# Jan

[![Gem Version](https://badge.fury.io/rb/jan.svg)](http://badge.fury.io/rb/jan)
[![Build Status](https://travis-ci.org/s-osa/jan.svg?branch=master)](https://travis-ci.org/s-osa/jan)

[jan](https://rubygems.org/gems/jan) is a small utility gem for JAN code.

## Supported versions

- Ruby
  - 2.7.x
  - 2.6.x
  - 2.5.x

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jan'
```

And then execute:

```sh
$ bundle
```

Or install it yourself as:

```sh
$ gem install jan
```

## Usage

### Basic

```ruby
code = Jan::Code.new('4901277241126')

code.valid? # => true

code.body # => '490127724112'
code.check_digit # => '6'

code.source_marking? # => true
code.instore_marking? # => false
```

### Calculate check digit

```ruby
body = Jan::CodeBody.new('490127724112')

body.calculate_check_digit # => '6'
body.generate_code # => '4901277241126'
```

### Generate random code

```ruby
random = Jan::Random.new

random.code # => '5689450935688'
random.instore_code # => '2799375754394'
```

## Contributing

Bug reports and pull requests are welcome.

- Install dependencies
  - `bundle install`
- Run tests
  - `rake spec`
