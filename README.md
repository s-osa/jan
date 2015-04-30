# Jan

[![Gem Version](https://badge.fury.io/rb/jan.svg)](http://badge.fury.io/rb/jan)
[![Build Status](https://travis-ci.org/s-osa/jan.svg?branch=master)](https://travis-ci.org/s-osa/jan)

A small utility for JAN code.


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

### Basic usage

```ruby
jan = Jan.new("4901277241126")
jan.valid? # => true

Jan::Validator.validate("4901277241126") # => true
```

### Calculate check digit

```ruby
# Correct code: "4901277241126"

Jan::CheckDigitCalculator.calculate("490127724112") # => 6
```


### Get elements

```ruby
jan = Jan.new("4901277241126")
jan.check_digit # => 6
jan.body # => "490127724112"

Jan::Parser.check_digit("4901277241126") # => 6
Jan::Parser.body("4901277241126") # => "490127724112"
```

### Discriminate in-store code

```ruby
jan = Jan.new("4901277241126")
jan.instore_code? # => false

Jan::Parser.instore_code?("2163179230340") # => true
```

### Generate random code

```ruby
Jan::Random.code # => "5689450935688"
Jan::Random.code(8) # => "11774853"

Jan::Random.instore_code # => "2799375754394"
Jan::Random.instore_code(8) # => "27393086"

```


## Contributing

1. Fork it ( https://github.com/[my-github-username]/jan/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
