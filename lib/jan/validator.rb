require "jan/parser"
require "jan/check_digit_calculator"

class Jan
  module Validator
    module_function

    def validate(code)
      code = code.to_s
      return false unless [8,13].include?(code.size)
      Parser.check_digit(code) == CheckDigitCalculator.calculate(Parser.body(code))
    end
  end
end
