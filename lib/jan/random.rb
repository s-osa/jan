require "jan/parser"
require "jan/check_digit_calculator"

class Jan
  module Random
    module_function

    Digits = %w(1 2 3 4 5 6 7 8 9 0)

    def code(size=13)
      build(size)
    end

    def instore_code(size=13)
      build(size - 2, InstorePrefixes.sample)
    end

    def build(size, code="")
      size.times{ code += Digits.sample }
      Parser.body(code) +  CheckDigitCalculator.calculate(Parser.body(code)).to_s
    end
  end
end
