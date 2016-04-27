# There are 10 types of people in the world: Those who understand binary, and those who don't.
# You and your fellow cohort of those in the "know" when it comes to binary decide to come up with a secret "handshake".
#
# 1 = wink
# 10 = double blink
# 100 = close your eyes
# 1000 = jump
#
#
# 10000 = Reverse the order of the operations in the secret handshake.
# Write a program that will convert a binary number, represented as a string (i.e. "101010"), and convert it to the appropriate sequence of events for a secret handshake.
#
#
# handshake = SecretHandshake.new "11001"
# handshake.commands # => ["jump","wink"]
# The program should consider strings specifying an invalid binary as the value 0.

class secretHandshake

  attr_reader : digits
    def initialize(decimal)
      begin
        @digits = decimal.to_s(2).reverse.chars.collect(&:to_i)
      rescue ArgumentError
        @digits = 0
    end
  end

  def commands
    handshake = []
    (0..3)to_a.each do |index|
    if @digits[index] == 1
        handshake << signals[index]
      end
  end


if digits[4] == 1
  handshake.reverse
else
  handshake
end

def signals
  ["wink", "double blink", "close your eyes", "jump"]
end
end

puts "enter a number to secretify"
number = gets.to_i
handshake = SecretHandshake.new(number)
puts handshake.commands
