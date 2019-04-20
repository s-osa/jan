module Jan
  class Symbol
    class BandPattern
      class CenterGuardPattern < self
        # @return [Array<Band>]
        def bands
          [
            Band::Space.new(1),
            Band::Bar.new(1),
            Band::Space.new(1),
            Band::Bar.new(1),
            Band::Space.new(1)
          ]
        end
      end
    end
  end
end
