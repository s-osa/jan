require "jan/parser"

class Jan < ::String
  module CheckDigitCalculator
    module_function

    def calculate(body)
      code = body.to_s + "x"
      digit = 10 - (Parser.even_digits(code).reduce(&:+) * 3 + Parser.odd_digits(code).reduce(&:+)) % 10
      digit % 10
    end
  end
end
