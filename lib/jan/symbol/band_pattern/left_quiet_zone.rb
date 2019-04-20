require 'jan/symbol/band'

module Jan
  class Symbol
    class BandPattern
      class LeftQuietZone < self
        # @return [Array<Band>]
        def bands
          [
            Band::Space.new(11)
          ]
        end
      end
    end
  end
end
