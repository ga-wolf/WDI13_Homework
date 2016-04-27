# Robot Name
# When robots come off the factory floor, they have no name.
#
# The first time you boot them up, a random name is generated, such as RX837 or BC811.
#
# In other words, if I say:
#
# puts "Robot 1: "
# robot1 = Robot.new
# puts robot1.name
# puts robot1.name
# puts robot1.name
#
# puts "Robot 2: "
# robot2 = Robot.new
# puts robot2.name
# puts robot2.name
# puts robot2.name
# then robot1 will print the same name 3 times, and robot2 will not have the same name as robot1.
#
# Every once in a while we need to reset a robot to its factory settings, which means that their name gets wiped. The next time you ask, it gets a new name.
#
# if I say:
#
# puts "Robot 3: "
# robot3 = Robot.new
# puts robot3.name
# puts robot3.name
# puts "Resetting to factory settings."
# robot3.reset
# puts robot3.name
# puts robot3.name
# then robot3 will have the same name twice, then we'll get the reset message, then it will get a new name, and print it twice.
#
# All robots have a mac address. The mac address never changes, even if you reset it to factory settings.
#
# Extensions
#
# Counters
#
# It's important that we not overwork our robots. While resetting to factory defaults is great, the wear and tear on the robot mechanics doesn't go away. Have your robot track the total number of operations that have been performed on it.
#
# puts "Robot 3: "
# robot3 = Robot.new
# puts robot3.name
# puts robot3.name
# puts "Resetting to factory settings."
# robot3.reset
# puts robot3.name
# puts robot3.name
# puts robot3.instruction_count # => 5
# Robot Time
#
# Number of instructions is important, but so is the total age of the robot.
#
# puts "Robot 3: "
# robot3 = Robot.new
# puts robot3.timers # => "21 seconds since last boot, 21 seconds since creation"
# puts robot3.name
# puts "Resetting to factory settings."
# robot3.reset
# puts robot3.timers # => "8 seconds since last boot, 29 seconds since creation"
# puts robot3.name
#
# # require 'pry'
# # require 'Securerandom'
# #
# #
# # class Robot
# #
# # def initialize()
# # @name = Securerandom.hex(3)
# # @macaddress = Securerandom.hex(1)
# # @born = Time.now
# # @last_reset =Time.now
# # # @letters = ("a".."z").to_a
# # # @randletter = @letters.sample
# # end
# #
# # def reset
# # @name = Securerandom.hex(3)
# # @last_reset =Time.now
# # end
# #
# # end
# # binding.pry
# # Robot.new
#
# ##### BADGER SOLUTION ######

require 'pry'

class Robot

def initialize
  generate_name
  @instruction_count = 1
  @create_time = Time.now
end

def generate_name
    letters = ("a".."z").to_a
    l = letters.sample(2).join
    numbers = (1..9).to_a
    n = numbers.sample(2).join
    @name = l+n
end

def reset_name
  generate_name
  instructions
  @boot_time = Time.now
end

def timers
@active_time = (Time.now - @created_time).round(2)
puts "This robot has been active for #{@active_time} seconds."
instructions
end

def instructions
  @instruction_count += 1
end


end
