
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


Lines = {
"N" => ['TIME SQUARE', '34TH', '28TH', '23RD', 'UNION SQUARE', '8TH'],
"L" => ['8TH', '6TH', 'UNION SQUARE', '3RD', '1ST'],
"6" => ['GRAND CENTRAL', '33RD', '28TH', '23RD', 'UNION SQUARE', 'ASTOR PLACE']
}


def plan_trip(startLine,startStation,stopLine,stopStation)
  if startLine == stopLine
     puts commute(startLine,startStation,stopStation)
  else
    puts commute(startLine,startStation,"UNION SQUARE")
    puts "Change to line #{stopLine} at the Union Square."
  puts  commute(stopLine,"UNION SQUARE",stopStation)
 end
end

def commute(travel_line,start,stop)
  stations =[]
    line = Lines[travel_line]
    startStation_index = line.index(start)
    stopStation_index = line.index(stop)
    if stopStation_index < startStation_index
       line.reverse!
       startStation_index = line.index(start)
       stopStation_index = line.index(stop)
     end
    until startStation_index > stopStation_index do
      stations << line[startStation_index]
      startStation_index +=1
    end
     stations
end

puts "WELCOME TO MTA TRAVEL APP"
print "Station in line N: "
p Lines["N"]
print "Station in line L: "
p Lines["L"]
print "Station in line S: "
p Lines["6"]
print " Enter your starting Line "
startLine   = gets.chomp
print " Enter your starting Station "
startStation   = gets.chomp
print " Enter your Stop Line "
stopLine   = gets.chomp
print " Enter your stop station "
stopStation   = gets.chomp

 plan_trip(startLine,startStation,stopLine,stopStation)

require 'pry'
binding.pry
