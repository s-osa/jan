require "spec_helper"

describe Jan::Random do
  describe ".code(size)" do
    (6..20).each do |size|
      it "should return code with valid check digit" do
        code = Jan::Random.code(size)
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

  describe ".instore_code(size)" do
    (6..20).each do |size|
      it "should return code with valid check digit" do
        code = Jan::Random.instore_code(size)
        check_digit = Jan::Parser.check_digit(code)
        actual      = Jan::CheckDigitCalculator.calculate(Jan::Parser.body(code))
        expect(actual).to eq(check_digit)
      end

      it "should return instore code" do
        code   = Jan::Random.instore_code(size)
        actual = Jan::Parser.instore_code?(code)
        expect(actual).to be true
      end

      it "should return given length valid code" do
        code = Jan::Random.instore_code(size)
        expect(code.size).to eq(size)
      end
    end
  end
end
