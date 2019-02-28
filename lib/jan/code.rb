require 'jan/code_body'
require 'jan/check_digit'

module Jan
  class Code < String
    # @param code [String]
    def initialize(code)
      @body = Jan::CodeBody.new(code[0..-2])
      @check_digit = Jan::CheckDigit.new(code[-1])
      super(code)
    end

    attr_reader :body, :check_digit

    # @return [boolean]
    def valid?
      @body.valid? && @check_digit.valid? && @body.calculate_check_digit == @check_digit
    end

    # @return [boolean]
    def instore_code?
      @body.start_with?('2')
    end
  end
end
