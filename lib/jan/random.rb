class Jan
  module Random
    module_function

    Digits       = %w(1 2 3 4 5 6 7 8 9 0)

    def code(size=13)
      code = (1..size).to_a.map{ Digits.sample }.join
      Parser.body(code) +  CheckDigitCalculator.calculate(Parser.body(code)).to_s
    end
  end
end
