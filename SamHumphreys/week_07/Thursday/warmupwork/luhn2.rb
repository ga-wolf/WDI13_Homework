# Luhn Formula
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

class Luhn
attr_accessor :sorted

  def initialize(input)
    @sorted = input.to_s.chars.reverse.map(&:to_i)
  end

  def checksum
    total = 0
    sorted.length.times do |i|
      if i.odd?
        if sorted[i] * 2 >=10
          total += sorted[i] * 2 - 9
        else
          total += sorted[i] * 2
        end
      else
        total += sorted[i]
      end
    end
    total = total % 10
    return total
  end

  def luhnify

  end

  def valid?
    if checksum == 0
      puts "That is a valid Luhn number"
    else
      puts "That is not a valid Luhn number"
      luhnify
    end
  end

end

puts "What number do you want to check: "
@number = gets.to_i

puts Luhn.new(@number).valid?
