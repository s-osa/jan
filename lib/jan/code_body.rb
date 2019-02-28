require 'jan/code'

module Jan
  class CodeBody < String
    # @param code_body [String]
    def initialize(code_body)
      @code_body = code_body
      super(code_body)
    end

    # @return [boolean]
    def valid?
      @code_body.match?(/\A\d{12}\z/)
    end

    # @return [Jan::CheckDigit]
    def calculate_check_digit
      # http://www.dsri.jp/jan/check_digit.html
      even_position_digits, odd_position_digits = @code_body.reverse.each_char.partition.with_index(2) {|_chr, idx| idx.even? }
      sum = even_position_digits.map{|d| Integer(d) }.sum * 3 + odd_position_digits.map{|d| Integer(d) }.sum
      digit = (10 - sum % 10).to_s[-1]
      Jan::CheckDigit.new(digit)
    end

    # @return [Jan::Code]
    def generate_code
      Jan::Code.new(@code_body + calculate_check_digit)
    end
  end
end
