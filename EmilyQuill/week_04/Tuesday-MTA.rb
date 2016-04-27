# MTA Lab

# planTrip('N', 'Times Square', '6', '33rd')
# // "Your must travel through the following stops on the N line: 34th, 28th, 23rd, Union Square."
# // "Change at Union Square."
# // "Your journey continues through the following stops: 23rd, 28th, 33rd."
# // "7 stops in total."

# Subway lines:
# The N line has the following stops: Times Square, 34th, 28th, 23rd, Union Square, and 8th
# The L line has the following stops: 8th, 6th, Union Square, 3rd, and 1st
# The 6 line has the following stops: Grand Central, 33rd, 28th, 23rd, Union Square, and Astor Place.
# All 3 subway lines intersect at Union Square, but there are no other intersection points. (For example, this means the 28th stop on the N line is different than the 28th street stop on the 6 line, so you'll have to differentiate this when you name your stops in the arrays.)

# Tell the user the number of stops AND the stops IN ORDER that they will pass through or change at.
require 'rainbow'

LINES = {
  "N" => {
    :stops => ['Times Square', '34th', '28th', '23rd', 'Union Square', '8th'],
  },
  "L" => {
    :stops => ['8th', '6th', 'Union Square', '3rd', '1st'],
  },
  "6" => {
    :stops => ['Grand Central', '33rd', '28th', '23rd', 'Union Square', 'Astor Place']
  }
}

def check_line(line)
  LINES.keys.include? line
end

def find_stop(line, station)
   return LINES[line][:stops].index(station) unless check_line(line) == false
   puts "You've entered an invalid line..?"
   exit
end

def print_trip_details(message)
    puts "\e[H\e[2J"
    puts Rainbow("= = = = Journey Details = = = =").green
    puts message
end

def prepare_simple_message(line_1, stops)
  message_1 = "You must travel through the following stops on the #{line_1} line: #{stops.join", "}"
  message_2 = "#{stops.length} stops in total"
  full_message = "#{message_1}\n#{message_2}"
  print_trip_details(full_message)
end

def simple_route(line_1, start, dest, direction)
  stops = LINES[line_1][:stops][dest..start-1].reverse if direction == -1
  stops = LINES[line_1][:stops][start+1..dest] if direction == 1
  prepare_simple_message(line_1, stops)
end

def prepare_complex_message(line_1, stops_1, line_2, stops_2)
  message_1 = "You must travel through the following stops on the #{line_1} line: #{stops_1.join", "}, then change at Union Square"
  message_2 = "Your journey continues on the #{line_2} line through the following stops: #{stops_2.join", "}"
  message_3 = "#{stops_1.length + stops_2.length} stops in total"
  full_message = "#{message_1}\n#{message_2}\n#{message_3}"
  print_trip_details(full_message)
end

def complex_route(line_1, direction_1, start, interchange_arrive, line_2, direction_2, dest, interchange_depart)
  stops_1 = LINES[line_1][:stops][interchange_arrive..start-1].reverse if direction_1 == -1
  stops_1 = LINES[line_1][:stops][start+1..interchange_arrive] if direction_1 == 1
  stops_2 = LINES[line_2][:stops][dest..interchange_depart-1].reverse if direction_2 == -1
  stops_2 = LINES[line_2][:stops][interchange_depart+1..dest] if direction_2 == 1
  prepare_complex_message(line_1, stops_1, line_2, stops_2)
end

def complex_route_direction(line_1, start, interchange_arrive, line_2, dest, interchange_depart)
  direction_1 = -1 if (start > interchange_arrive)
  direction_1 = 1 if (start <= interchange_arrive)
  direction_2 = -1 if (interchange_depart > dest)
  direction_2 = 1 if (interchange_depart < dest)
  complex_route(line_1, direction_1, start, interchange_arrive, line_2, direction_2, dest, interchange_depart)
end

def plan_complex_trip(line_1, start, line_2, dest)
  interchange_arrive = find_stop(line_1, "Union Square")
  interchange_depart = find_stop(line_2, "Union Square")
  complex_route_direction(line_1, start, interchange_arrive, line_2, dest, interchange_depart)
end

def plan_simple_trip(line_1, start, line_2, dest)
  if line_2 == line_1 # Journey is on one line
    direction = -1 if (start > dest)
    direction = 1 if (start < dest)
    simple_route(line_1, start, dest, direction)
  end
end

def already_there?(line_1, start, line_2, dest)
  plan_complex_trip(line_1, start, line_2, dest) unless line_1 == line_2
  plan_simple_trip(line_1, start, line_2, dest) unless start == dest
  puts "Looks like you're already there.. my work is done!\nOver and out.."
  exit
end

def validate_trip(line_1, start, line_2, dest)
  start = find_stop(line_1, start)
  dest = find_stop(line_2, dest)
  already_there?(line_1, start, line_2, dest) unless (start == nil || dest == nil)
  puts "I'm not sure where you are or where you're going.. Try again!"
  exit
end

def get_input
  puts "What's your starting line?"
  line_1 = gets.chomp
  puts "Alright, what station are you at?"
  start = gets.chomp
  puts "Great! What line is your destination on?"
  line_2 = gets.chomp
  puts "Yep, and what station do you want to go to?"
  dest = gets.chomp
  validate_trip(line_1, start, line_2, dest)
end

get_input
