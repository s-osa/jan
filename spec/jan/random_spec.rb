require "spec_helper"

describe Jan::Random do
  describe ".code(size)" do
    (6..20).each do |size|
      it "should return valid code" do
        code = Jan::Random.code
        check_digit = Jan::Parser.check_digit(code)
        actual      = Jan::CheckDigitCalculator.calculate(Jan::Parser.body(code))
        expect(actual).to eq(check_digit)
      end

      it "should return given length valid code" do
        code = Jan::Random.code(size)
        expect(code.size).to eq(size)
      end
    end
  end
end
