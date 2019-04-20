module Jan
  class Symbol
    class BandPattern
      class RightQuietZone < self
        # @return [Array<Band>]
        def bands
          [
            Band::Space.new(7)
          ]
        end
      end
    end
  end
end
