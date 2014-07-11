require "jan/parser"

class Jan
  class Validator
    class << self
      def validate(code)
        code = code.to_s
        return false unless [8,13].include?(code.size)
        Parser.checkdigit(code) == CheckDigitCalculator.calculate(Parser.body(code))
      end
    end
  end
end
