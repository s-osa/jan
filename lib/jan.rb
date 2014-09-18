require "jan/check_digit_calculator"
require "jan/parser"
require "jan/random"
require "jan/validator"
require "jan/version"

class Jan < ::String
  InstoreCodePrefixes = %w(02 20 21 22 23 24 25 26 27 28 29)

  def initialize(code)
    super(code.to_s)
  end

  def valid?
    Validator.validate(self)
  end

  def check_digit
    Parser.check_digit(self)
  end

  def body
    Parser.body(self)
  end

  def even_digits
    Parser.even_digits(self)
  end

  def odd_digits
    Parser.odd_digits(self)
  end

  def instore_code?
    Parser.instore_code?(self)
  end
end
