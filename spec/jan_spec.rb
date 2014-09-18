require "spec_helper"

describe Jan do
  describe "#initialize" do
    let(:jan_code){ "4901085089347" }
    subject{ described_class.new(jan_code) }
    it{ is_expected.to be_an_instance_of(described_class) }
    it{ is_expected.to be_a(String) }
    it("should equals to given string"){ is_expected.to eq(jan_code) }
  end

  describe "#valid?" do
    context "valid codes" do
      valid_codes.each do |valid_code|
        subject{ described_class.new(valid_code) }
        it("#{valid_code} should be valid"){ is_expected.to be_valid }
      end
    end

    context "invalid codes" do
      invalid_codes.each do |invalid_code|
        subject{ described_class.new(invalid_code) }
        it("#{invalid_code} should be invalid"){ is_expected.not_to be_valid }
      end
    end
  end

  describe "#check_digit" do
    let(:jan){ described_class.new("4901277241126") }
    subject{ jan.check_digit }
    it("should return last digit"){ is_expected.to eq(6) }
  end

  describe "#even_digits" do
    let(:jan){ described_class.new("4901277241126") }
    subject{ jan.even_digits }
    it("should return digits in even number-th position"){ is_expected.to eq([9,1,7,2,1,2]) }
  end

  describe "#odd_digits" do
    let(:jan){ described_class.new("4901277241126") }
    subject{ jan.odd_digits }
    it("should return digits in odd number-th position except check digit"){ is_expected.to eq([4,0,2,7,4,1]) }
  end

  describe "#instore_code?" do
    context "instore code" do
      subject{ described_class.new("2101085089347") }
      it("should be true"){ is_expected.to be_instore_code }
    end

    context "global code" do
      subject{ described_class.new("4901085089347") }
      it("should be false"){ is_expected.not_to be_instore_code }
    end
  end
end
