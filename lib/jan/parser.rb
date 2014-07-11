class Jan
  module Parser
    module_function

    def check_digit(code)
      code[-1].to_i
    end

    def body(code)
      code[0..-2]
    end

    def even_digits(code)
      code.split('').reverse.map(&:to_i).select.with_index(1){|_d, index| index.even? }.reverse
    end

    def odd_digits(code)
      code.split('').reverse.map(&:to_i).select.with_index(1){|_d, index| index.odd? }.reverse[0..-2]
    end
  end
end
