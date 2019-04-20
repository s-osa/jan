module Jan
  class Symbol
    class Band
      # @param width [Integer]
      # @param color [String]
      def initialize(width, color:)
        @width = width
        @color = color
      end

      attr_reader :width, :color

      # @param other [Jan::Symbol::Band]
      # @return [boolean]
      def ==(other)
        self.width == other.width && self.color == other.color
      end
    end
  end
end
