module Jan
  class Symbol
    class BandPattern
      class NormalGuardPattern < self
        # @return [Array<Band>]
        def bands
          [
            Band::Bar.new(1),
            Band::Space.new(1),
            Band::Bar.new(1)
          ]
        end
      end
    end
  end
end
