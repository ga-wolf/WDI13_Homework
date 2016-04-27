# MTA Lab  RUBY
# Activity:
#
# Students should create a program that models a simple subway system.
#
# The program takes the line and stop that a user is getting on at and the line and stop that user is getting off at and prints the total number of stops for the trip.
#
# There are 3 subway lines:
# The N line has the following stops: Times Square, 34th, 28th, 23rd, Union Square, and 8th
# The L line has the following stops: 8th, 6th, Union Square, 3rd, and 1st
# The 6 line has the following stops: Grand Central, 33rd, 28th, 23rd, Union Square, and Astor Place.
# All 3 subway lines intersect at Union Square, but there are no other intersection points.
# For example, this means the 28th stop on the N line is different than the 28th street stop on the 6 line, so you'll have to differentiate this when you name your stops in the arrays.
# Hints:
#
# Don't worry about user input initially: get it working with hardcoded values first, and wire up the user interface once that's working
# Consider diagraming the lines by sketching out the subway lines and their stops and intersection.
# Make subway lines keys in a hash, while the values are an array of all the stops on each line.
# The key to the lab is to find the intersection of the lines at Union Square.
# Make sure the stops that are the same for different lines have different names (i.e. 23rd on the N and on the 6 need to be differentiated)

require 'pry'

@lines = {
  "N" => ["times square", "34th", "28th", "23rd", "union square", "8th"],
  "L" => ["8th", "6th", "union square", "3rd", "1st"],
  "6" => ["grand central", "33rd", "28th", "23rd", "union square", "astor place"]
}

@travel_route = []

print "Enter departure line: "
@departure_line = gets.chomp.upcase

print "Enter departure station: "
@departure_station = gets.chomp.downcase

print "Enter arrival line: "
@arrival_line = gets.chomp.upcase

print "Enter arrival station: "
@arrival_station = gets.chomp.downcase

def departure_station_index
  @lines[@departure_line].index @departure_station
end

def arrival_station_index
  @lines[@arrival_line].index @arrival_station
end

def union_square_index(line)
  @lines[line].index "union square"
end

def travel_forward(start_station, end_station, line)
  line = @lines[line]
  line[start_station+1..end_station].each do |i|
    @travel_route << i
  end
end

def travel_backward(start_station, end_station, line)
  line = @lines[line]
  line[end_station+1..start_station].reverse.each do |i|
    @travel_route << i
  end
end

def plan_trip
  if @departure_line == @arrival_line
    if departure_station_index < arrival_station_index
      travel_forward(departure_station_index, arrival_station_index,@departure_line)
    else
      travel_backward(departure_station_index, arrival_station_index,@departure_line)
    end
    # puts "You must travel through the following stops on the #{@departure_line} line: #{@travel_route}"
  else
    if departure_station_index < union_square_index(@departure_line)
      travel_forward(departure_station_index, union_square_index(@departure_line),@departure_line)
    else
      travel_backward(departure_station_index, union_square_index(@departure_line),@departure_line)
    end
    if arrival_station_index > union_square_index(@arrival_line)
      travel_forward(union_square_index(@arrival_line), arrival_station_index,@arrival_line)
    else
      travel_backward(union_square_index(@arrival_line), arrival_station_index,@arrival_line)
    end
  end
end

plan_trip

# puts "You must travel through the following stops on the #{@departure_line} line: #{@travel_route}"

puts @travel_route

# binding.pry
