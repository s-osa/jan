module Jan
  class CheckDigit < String
    # @param check_digit [String]
    def initialize(check_digit)
      @check_digit = check_digit
      super(check_digit)
    end

    # @return [boolean]
    def valid?
      @check_digit.match?(/\A\d\z/)
    end
  end
end
