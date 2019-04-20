require 'jan/symbol/band'

module Jan
  class Symbol
    class Bar < Band
      # @param width [Integer]
      # @param color [String]
      def initialize(width, color: 'black')
        super(width, color: color)
      end
    end
  end
end
