require "spec_helper"

describe Jan::CheckDigitCalculator do
  describe ".calculate" do
    it "should return check digit" do
      actual = Jan::CheckDigitCalculator.calculate("490127724112")
      expect(actual).to eq(6)
    end

    it "should return 0 as check digit" do
      actual = Jan::CheckDigitCalculator.calculate("490330111020")
      expect(actual).to eq(0)
    end
  end
end
