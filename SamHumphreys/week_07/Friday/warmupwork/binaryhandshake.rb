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

class SecretHandshake

  attr_accessor :handshake

  def initialize(handshake)
    @handshake = handshake
  end

  def commands
    @handshake = %w(10101)
    @commands = []
    instructions = {
      1=> 'jump',
      2=> 'close eyes',
      3=> 'double blink',
      4=> 'wink'
    }
    for i in 1..@handshake.length-1 do
      if @handshake[i] == 1
        commands << instructions[i]
      end
    end
    if @handshake[0] == 1
      commands.reverse
    end
    puts @commands
    # return commands
  end

end

puts "Enter the handshake code"
input = gets.to_s.split('')
puts SecretHandshake.new(input).commands
