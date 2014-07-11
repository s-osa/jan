class Jan
  class Validator
    class << self
      def validate(code)
        code = code.to_s
        return false unless [8,13].include?(code.size)

        even_sum = even_position_numbers(code).reduce(&:+)
        odd_sum  = odd_position_numbers(code).reduce(&:+)

        checkdigit(code) == 10 - (even_sum * 3 + odd_sum) % 10
      end

      def checkdigit(code)
        code[-1].to_i
      end

      def even_position_numbers(code)
        code.split('').reverse.map(&:to_i).select.with_index(1){|_d, index| index.even? }.reverse
      end

      def odd_position_numbers(code)
        code.split('').reverse.map(&:to_i).select.with_index(1){|_d, index| index.odd? }.reverse[0..-2]
      end
    end
  end
end
