require "jan/version"
require "jan/validator"

class Jan
  attr_accessor :code

  def initialize(code)
    @code = code
  end

  def valid?
    Validator.validate(@code)
  end
end
