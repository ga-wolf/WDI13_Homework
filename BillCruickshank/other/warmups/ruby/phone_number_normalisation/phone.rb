class Phone
  attr_accessor :number

  def initialize string
    if string =~ /(\d[()\s-.,]*){10}/
      @number = normalize string
    else
      @number = "0000000000"
    end
  end

  def normalize string
    digits = string.scan(/\d/)
    if (digits.length == 11) && (digits[0] == "1")
      digits = digits.drop(1)
    elsif (digits.length == 11)
      digits = ["0"]*10
    end
    digits.join('');
  end

  def area_code
    @number.slice(0,3)
  end

#  assert_equal "(123) 456-7890", number.to_s

  def to_s
    "(#{ self.area_code }) #{ @number.slice(3,3) }-#{ @number.slice(6,4) }"
  end
end
