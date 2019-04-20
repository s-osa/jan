module Jan
  class Symbol
    class BandPattern
      class SymbolCharacter < self
        # @param name [String]
        def initialize(name)
          unless name.match?(/\A[ABC]\d\z/)
            raise ArgumentError
          end

          @name = name
        end

        # @return [Array<Jan::Symbol::Band>]
        def bands
          set_name, digit = @name.split('')

          case set_name
          when 'A'
            stripe_pattern = [Band::Space, Band::Bar, Band::Space, Band::Bar]
            width_arr = width_array(digit)
          when 'B'
            stripe_pattern = [Band::Space, Band::Bar, Band::Space, Band::Bar]
            width_arr = width_array(digit).reverse
          when 'C'
            stripe_pattern = [Band::Bar, Band::Space, Band::Bar, Band::Space]
            width_arr = width_array(digit)
          end

          stripe_pattern.zip(width_arr).map { |klass, width|
            klass.new(width)
          }
        end

        private

        def width_array(digit)
          case digit
          when '0' then [3, 2, 1, 1]
          when '1' then [2, 2, 2, 1]
          when '2' then [2, 1, 2, 2]
          when '3' then [1, 4, 1, 1]
          when '4' then [1, 1, 3, 2]
          when '5' then [1, 2, 3, 1]
          when '6' then [1, 1, 1, 4]
          when '7' then [1, 3, 1, 2]
          when '8' then [1, 2, 1, 3]
          when '9' then [3, 1, 1, 2]
          end
        end
      end
    end
  end
end
