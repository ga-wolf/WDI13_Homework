# Write a program that can take a number and determine whether or not it is valid per the Luhn formula.
#
# The Luhn formula is a simple checksum formula used to validate a variety of identification numbers, such as credit card numbers and Canadian Social Insurance Numbers.
#
# The formula verifies a number against its included check digit, which is usually appended to a partial number to generate the full number. This number must pass the following test:
#
# Counting from rightmost digit (which is the check digit) and moving left, double the value of every second digit.
#
# For any digits that thus become 10 or more, subtract 9 from the result.
#
# E.g., 1111 becomes 2121, while 8763 becomes 7733 (from 2×6=12 → 12-9=3 and 2×8=16 → 16-9=7).
#
# Add all these digits together. For example, if 1111 becomes 2121, then 2+1+2+1 is 6; and 8763 becomes 7733, so 7+7+3+3 is 20.
#
# If the total ends in 0 (put another way, if the total modulus 10 is congruent to 0), then the number is valid according to the Luhn formula; else it is not valid. So, 1111 is not valid (as shown above, it comes out to 6), while 8763 is valid (as shown above, it comes out to 20).
#
# Write a program that, given a number
#
# a) can check if it is valid per the Luhn formula.
#
# b) can add a check digit to make the number valid per the Luhn formula.
#
# Luhn.new(3554).valid?
# # => true



# BADGERS SOLUTION
class Luhn

attr_reader :number

  def initialize(number)
    @number = number
  end

def luhnify
  numbers = []
  number.to_s.reverse.split('').map(&:to_i).each_with_index do |d, i|
    value = i.even? ? d : d * 2
    value -= 9 if value > 9
    numbers << value
  end
  numbers.reverse
  end

def checksum
  # reduce and inject are the same/ interchangeable
  #inject method means that take the luhnify array
  # add 0 to the beginning as a sum(just a placeholder)
  # then for each number value in the array add a + inbetween
  # this effectively concatenates the array

  #e.g. inject(0) do |sum, num|     --- > the 0 here can be any data type
  # sum + num
  # end
  luhnify.inject(0, :+)
end


def valid?
  if checksum % 10 == 0
    puts "#{number} is a valid luhn number"
  else
    luhn =number * 10 + (10 - checksum % 10)
    # luhn = (number + 10) - (checksum % 10)
    puts "#{luhn} would be a valid luhn number"
end

end


puts "Enter a number"
number = gets.to_i
puts Luhn.new(number).valid?





# $i = 0
# def number_test(input)
# # reverse and split the number into an array
# reverse_array = input.to_s.reverse.split('').map(&:to_i)
#
# #select every 2nd
# test = reverse_array.select.each_with_index { |_, i| i.odd?}
#
# #reverse and concatenate the number now
#
# puts reverse_array
# puts test
# end
#
# number_test(8763)
