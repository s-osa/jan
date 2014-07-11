require "jan/parser"

class Jan
  class Validator
    class << self
      def validate(code)
        code = code.to_s
        return false unless [8,13].include?(code.size)

        even_sum = Parser.even_digits(code).reduce(&:+)
        odd_sum  = Parser.odd_digits(code).reduce(&:+)

        Parser.checkdigit(code) == 10 - (even_sum * 3 + odd_sum) % 10
      end
    end
  end
end
