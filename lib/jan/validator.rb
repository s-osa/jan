require "jan/parser"
require "jan/check_digit_calculator"

class Jan
  module Validator
    module_function

    def validate(code)
      code = code.to_s
      return false unless validate_size(code)
      Parser.check_digit(code) == CheckDigitCalculator.calculate(Parser.body(code))
    end

    def validate_size(code)
      [8,13].include?(code.to_s.size)
    end
  end
end
