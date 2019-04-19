module Jan
  class Symbol
    class Module
      # @param width [Integer]
      # @param color [String]
      def initialize(width, color:)
        @width = width
        @color = color
      end

      attr_reader :width, :color

      # @param other [Jan::Symbol::Module]
      # @return [boolean]
      def ==(other)
        self.width == other.width && self.color == other.color
      end
    end
  end
end
