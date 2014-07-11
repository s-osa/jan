require "jan/version"
require "jan/parser"
require "jan/validator"

class Jan
  attr_accessor :code

  def initialize(code)
    @code = code
  end

  def valid?
    Validator.validate(@code)
  end

  def checkdigit
    Parser.checkdigit(@code)
  end

  def even_digits
    Parser.even_digits(@code)
  end

  def odd_digits
    Parser.odd_digits(@code)
  end
end
