require 'jan/symbol/band_pattern/left_quiet_zone'
require 'jan/symbol/band_pattern/right_quiet_zone'
require 'jan/symbol/band_pattern/normal_guard_pattern'
require 'jan/symbol/band_pattern/center_guard_pattern'
require 'jan/symbol/band_pattern/symbol_character'

module Jan
  class Symbol
    class BandPattern
      # @return [Array<Band>]
      def bands
        raise NotImplementedError
      end
    end
  end
end
