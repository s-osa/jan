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
end
