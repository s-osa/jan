module Jan
  class Random
    # @param generator [Random] Random-like object which respond to #rand(max)
    def initialize(generator: ::Random.new)
      @generator = generator
    end

    # @return [Jan::Code]
    def code
      twelve_digits_str = sprintf('%012d', @generator.rand(1_000_000_000_000))
      Jan::CodeBody.new(twelve_digits_str).generate_code
    end

    # @return [Jan::Code]
    def instore_code
      twelve_digits_str = '2' + sprintf('%011d', @generator.rand(100_000_000_000))
      Jan::CodeBody.new(twelve_digits_str).generate_code
    end
  end
end
