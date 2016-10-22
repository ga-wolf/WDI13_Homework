# Write a program that cleans up user-entered phone numbers so that they can be sent SMS messages.
#
# The rules are as follows:
#
# If the phone number is less than 10 digits assume that it is bad number
# If the phone number is 10 digits assume that it is good
# If the phone number is 11 digits and the first number is 1, trim the 1 and use the first 10 digits
# If the phone number is 11 digits and the first number is not 1, then it is a bad number
# If the phone number is more than 11 digits assume that it is a bad number
# We've provided tests, now make them pass.
#
# Hint: Only make one test pass at a time. You can turn off tests by sending the message skip to it:
#
# def test_string_conversion
#   skip
#   assert_equal 1, "1".to_i
# end

class Phonenumber
  attr_accessor :number

  def initialize(number)
    @number = number
  end

  def check_length(array)
    if array.length < 10 || array.length > 11
      return false
    else
      return true
    end
  end

  def check_ten_or_eleven(array)
    if array.length == 10
      return true
    elsif array.length == 11
      if array[0] == '1'
        array.shift
        return array
      else
        return false
      end
    end


  end

  def check_number
    input = number.to_s.chars
    array = []

    input.each do |n|
      if n.to_i.instance_of? Fixnum
        array << n.to_i
      end
    end

    puts array

    if !check_length(array)
      return false
    elsif check_ten_or_eleven(array)
      print array.join('') + ' is a valid number!'
    else
      return false
    end
  end
end

puts 'What phone number do you want to check? '
input = gets.chomp

phone = Phonenumber.new(input)
puts phone.check_number
