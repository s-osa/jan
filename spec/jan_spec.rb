require "spec_helper"

describe Jan do
  describe "#valid?" do
    context "valid codes" do
      valid_codes.each do |code|
        it "#{code} should be valid" do
          jan = Jan.new(code)
          expect(jan.valid?).to be true
        end
      end
    end

    context "invalid codes" do
      invalid_codes.each do |code|
        it "#{code} should be invalid" do
          jan = Jan.new(code)
          expect(jan.valid?).to be false
        end
      end
    end
  end

  describe "#checkdigit" do
    it "should return last digit" do
      jan = Jan.new("4901277241126")
      expect(jan.checkdigit).to eq(6)
    end
  end

  describe "#even_digits" do
    it "should return digits in even number-th position" do
      jan = Jan.new("4901277241126")
      expect(jan.even_digits).to eq([9,1,7,2,1,2])
    end
  end

  describe "#odd_digits" do
    it "should return digits in odd number-th position except checkdigit" do
      jan = Jan.new("4901277241126")
      expect(jan.odd_digits).to eq([4,0,2,7,4,1])
    end
  end
end
