require 'jan/symbol/band_pattern'
require 'jan/symbol/band'

module Jan
  class Symbol
    # @param code [String]
    def initialize(code)
      @code = code
    end

    # @return [Array<Jan::Symbol::BandPattern>]
    def band_patterns
      [
        BandPattern::LeftQuietZone.new,
        BandPattern::NormalGuardPattern.new
      ] + left_symbol_characters + [
        BandPattern::CenterGuardPattern.new,
      ] + right_symbol_characters + [
        BandPattern::NormalGuardPattern.new,
        BandPattern::RightQuietZone.new
      ]
    end

    private

    # @return [Array<Jan::Symbol::BandPattern::SymbolCharacter>]
    def left_symbol_characters
      additional_digits = @code[0]
      left_digits = @code[1..6].each_char.to_a

      left_digits.map { |digit|
        # DOTO
        name = 'C' + digit
        BandPattern::SymbolCharacter.new(name)
      }
    end

    # @return [Array<Jan::Symbol::BandPattern::SymbolCharacter>]
    def right_symbol_characters
      right_digits = @code[7..12].each_char.to_a

      right_digits.map { |digit|
        name = 'C' + digit
        BandPattern::SymbolCharacter.new(name)
      }
    end
  end
end
