require "jan/parser"

class Jan
  module CheckDigitCalculator
    module_function

    def calculate(code)
      code = code.to_s + "x"
      10 - (Parser.even_digits(code).reduce(&:+) * 3 + Parser.odd_digits(code).reduce(&:+)) % 10
    end
  end
end
