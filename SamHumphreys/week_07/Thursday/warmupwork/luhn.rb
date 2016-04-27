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

@num_to_check = 8763;

def make_array
  @num_as_array = @num_to_check.to_s.chars.map(&:to_i).reverse
end

def double_second_and_mod
  for i in 0..(@num_as_array.length - 1)
    if i.odd?
      @num_as_array[i] = @num_as_array[i] * 2
      if @num_as_array[i] >= 10
        @num_as_array[i] -=9
      end
    end
  end
end

def check_check_digit
  check_sum = 0
  for i in 0..(@num_as_array.length-1)
    check_sum += @num_as_array[i]
  end
  if check_sum%10 == 0
    puts "valid"
  else
    puts "invalid"
  end
end

def add_check_digit
  check_sum = 0
  for i in 0..(@num_as_array.length-1)
    check_sum += @num_as_array[i]
  end
  check_sum = check_sum%10
  @num_as_array.shift(10-check_sum)
  new_number = @num_as_array.reverse.join('')
  puts new_number
end

puts @num_to_check

make_array
double_second_and_mod
# check_check_digit
add_check_digit
