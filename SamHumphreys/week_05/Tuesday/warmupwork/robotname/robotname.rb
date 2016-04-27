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


require 'pry'

class Robot
  attr_accessor :name, :instruction_count, :uptime

  def initialize
    self.name = makename
    self.instruction_count = 1
    self.uptime = Time.now
  end

  def reset
    self.name = makename
    self.instruction_count += 1
    self.uptime = Time.now
  end

  def timers
    active_time = (Time.now - self.uptime)
    puts "This robot has been active for #{active_time} seconds"
  end

end

def makename
  letters = %w(A B C D E F)
  l = letters.sample(2).join
  numbers = %w(1 2 3 4 5 6 7 8 9 0)
  n = numbers.sample(3).join
  name = l+n
end
