require "spec_helper"

describe Jan::CheckDigitCalculator do
  describe ".calculate" do
    it "should return check digit" do
      actual = Jan::CheckDigitCalculator.calculate("490127724112")
      expect(actual).to eq(6)
    end
  end
end
