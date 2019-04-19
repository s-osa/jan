module Jan
  class Symbol
    class Bar < Module
      # @param width [Integer]
      # @param color [String]
      def initialize(width, color: 'black')
        super(width, color: color)
      end
    end
  end
end
