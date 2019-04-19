module Jan
  class Symbol
    class Space < Module
      # @param width [Integer]
      # @param color [String]
      def initialize(width, color: 'white')
        super(width, color: color)
      end
    end
  end
end
