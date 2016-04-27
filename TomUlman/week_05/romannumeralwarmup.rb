# The Romans were a clever bunch. They conquered most of Europe and ruled it for hundreds of years. They invented concrete and straight roads and even bikinis. One thing they never discovered though was the number zero. This made writing and dating extensive histories of their exploits slightly more challenging, but the system of numbers they came up with is still in use today. For example the BBC uses Roman numerals to date their programmes.
#
# The Romans wrote numbers using letters - I, V, X, L, C, D, M. (notice these letters have lots of straight lines and are hence easy to hack into stone tablets).
#
#  1  => I
# 10  => X
#  7  => VII
# There is no need to be able to convert numbers larger than about 3000. (The Romans themselves didn't tend to go any higher)
#
# Wikipedia says: Modern Roman numerals ... are written by expressing each digit separately starting with the left most digit and skipping any digit with a value of zero.
#
# To see this in practice, consider the example of 1990.
#
# In Roman numerals 1990 is MCMXC:
#
# 1000=M 900=CM 90=XC
#
# 2008 is written as MMVIII:
#
# 2000=MM 8=VIII

# You can combine letters to add values, by listing them largest to smallest from left to right:
#
# II   is 2
# VIII  is 8
# XXXI is 31
#
# However, you may only list three consecutive identical letters. That requires a special rule to express numbers like 4 and 900. That rule is that a single lower value may proceed a larger value, to indicate subtraction. This rule is only used to build values not reachable by the previous rules:
#
# IV is 4
# CM is 900
#
# But 15 is XV, not XVX.
# 10.divmod 3 === [3,1]



# HELP! ....

# ROMAN_MAP =  {   1 => "I",
#                  4 => "IV",
#                  5 => "V",
#                  9 => "IX",
#                  10 => "X",
#                  40 => "XL",
#                  50 => "L",
#                  90 => "XC",
#                  100 => "C",
#                  400 => "CD",
#                  500 => "D",
#                  900 => "CM",
#                  1000 => "M"
#              }
# puts ROMAN_MAP[50]
#
# def Conversion (number) {
# ROMAN_NUMERALS = Array.new(number) do |index|
#
# }

############################################# Badger Solution ######################################


class RomanNumerals

  #create initialize method

def initialize(num)
  to_roman(num)
end

#method to do Conversion
def to_roman(num)

  result = ""

  roman_mappings.each do |arabic, roman|
      #if 2000 appended to result then repeat
      while num >= arabic
        result << roman
        num -= arabic
      end
    end
    puts result
end


#map arabic numerals to roman numerals

  def roman_mappings
    {
    1000 => 'M',
    900 => 'CM',
    500 => 'D',
    400 => 'CD',
    100 => 'C',
    90 => 'XC',
    50 => 'L',
    40 => 'XL',
    10 => 'X',
    9 => 'IX',
    5 => 'V',
    4 => 'IV',
    1 => 'I',
    }
  end
end

RomanNumerals.new(1900)
