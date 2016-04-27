# Title: MTA Lab
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

# Declare three arrays
n_Line = ["Times Square", "34th", "28th", "23rd", "Union Square", "8th"]
l_Line = ["8th", "6th", "Union Square", "3rd", "1st"]
six_Line = ["Grand Central", "33rd", "28th", "23rd", "Union Square","Astor Place"]

# Ask for user input that collects four pieces of data: start_line, start_station
# end_line and end_station.
puts "What is your start line ?"
gets = start_line

puts "What is your start station ?"
gets = start_station

puts "What is your end line ?"
gets = end_line

puts "What is your end station ?"
gets = end_station

# Declare empty array
plan_Trip = []

# This is where I am lost ???
start_line.index ""
start_station.index ""
end_line ""
end_station ""

start_index = start_line.index(start_station)


# # Which line it is
# nLine
#
# # Where is the first stop
# startIndex = nLine.index "34th"
#
# # Where is the last stop
# endIndex = nLine.index "8th"
#
# # Go through them
# nLine.each do |station|
#   puts station
# end
