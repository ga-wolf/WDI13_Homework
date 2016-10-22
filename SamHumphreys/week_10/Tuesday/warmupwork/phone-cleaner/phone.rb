class Phone
  attr_accessor :number

  def initialize(number)
    @number = clean(number)
  end

  def clean(number)
    number = number.gsub(/[^0-9]/,"")
    valid(number)
  end

  def valid(number)
    if number.length == 11 && number.start_with?('1')
      return number[1..10]
    elsif (number.length == 11 && !number.start_with?('1')) || number.length == 9
      return "0000000000"
    elsif number.length == 10
      return number
    end
  end

  def area_code
    return number[0..2]
  end

  def middle
    return number[3..5]
  end

  def end
    return number[6..10]
  end

  def 
end
