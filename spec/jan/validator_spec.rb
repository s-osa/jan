require "spec_helper"

describe Jan::Validator do
  describe ".validate" do
    context "valid codes" do
      valid_codes.each do |code|
        it "#{code} should be valid" do
          actual = Jan::Validator.validate(code)
          expect(actual).to be true
        end
      end
    end

    context "invalid codes" do
      invalid_codes.each do |code|
        it "#{code} should be invalid" do
          actual = Jan::Validator.validate(code)
          expect(actual).to be false
        end
      end
    end
  end
end
