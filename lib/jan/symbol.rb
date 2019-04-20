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

    # @return [Array<String>]
    def codepoints
      additional_digit, *digits = @code.each_char.to_a
      variable_parity_encodation_sequence(additional_digit).zip(digits).map(&:join)
    end

    private

    # @return [Array<Jan::Symbol::BandPattern::SymbolCharacter>]
    def left_symbol_characters
      codepoints[0..5].map { |codepoint|
        BandPattern::SymbolCharacter.new(codepoint)
      }
    end

    # @return [Array<Jan::Symbol::BandPattern::SymbolCharacter>]
    def right_symbol_characters
      codepoints[6..11].map { |codepoint|
        BandPattern::SymbolCharacter.new(codepoint)
      }
    end

    # @param digit [String]
    # @return [Array<String>]
    def variable_parity_encodation_sequence(digit)
      case digit
      when '0'
        %w[A A A A A A C C C C C C]
      when '1'
        %w[A A B A B B C C C C C C]
      when '2'
        %w[A A B B A B C C C C C C]
      when '3'
        %w[A A B B B A C C C C C C]
      when '4'
        %w[A B A A B B C C C C C C]
      when '5'
        %w[A B B A A B C C C C C C]
      when '6'
        %w[A B B B A A C C C C C C]
      when '7'
        %w[A B A B A B C C C C C C]
      when '8'
        %w[A B A B B A C C C C C C]
      when '9'
        %w[A B B A B A C C C C C C]
      end
    end
  end
end
