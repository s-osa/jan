require "jan/parser"
require "jan/check_digit_calculator"

class Jan
  module Validator
    module_function

    def validate(code)
      validate_size(code.to_s) && validate_check_digit(code.to_s)
    end

    def validate_size(code)
      [8,13].include?(code.to_s.size)
    end

    def validate_check_digit(code)
      Parser.check_digit(code.to_s) == CheckDigitCalculator.calculate(Parser.body(code.to_s))
    end
  end
end
