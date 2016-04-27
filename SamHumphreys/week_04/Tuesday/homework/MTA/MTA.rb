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

@lines = {
  "N" => {
    :stops => ['Times Square', '34th', '28th', '23rd', 'Union Square', '8th']
  },
  "L" => {
    :stops => ['8th', '6th', 'Union Square', '3rd', '1st']
  },
  "6" => {
    :stops => ['Grand Central', '33rd', '28th', '23rd', 'Union Square', 'Astor Place']
  }
}

@journey = {
  :start_line => "N",
  :start_station => "34th",
  :stop_line => "N",
  :stop_station => "28th",
  :saved_line => "",
  :saved_station => "",
  :trip_length => 0
}

def get_journey
  print "What is your starting line? "
  @journey[:start_line] = gets.chomp.upcase
  print "What's your starting stations? "
  @journey[:start_station] = gets.chomp
  print "What is your destination line? "
  @journey[:stop_line] = gets.chomp.upcase
  print "What is your destination station? "
  @journey[:stop_station] = gets.chomp
  evaluate
end

def evaluate
  start_line = @lines.keys.find_index(@journey[:start_line])
  stop_line = @lines.keys.find_index(@journey[:stop_line])
  if start_line == nil || stop_line == nil
    puts "Wrong input, incorrect line names"
    continue
    return
  end
  start_index = @lines[@journey[:start_line]][:stops].find_index(@journey[:start_station])
  stop_index =  @lines[@journey[:stop_line]][:stops].find_index(@journey[:stop_station])
  if start_index == nil || stop_index == nil
    puts "Wrong input, incorrect station names."
    continue
    return
  end
  check_trip
end

def directions
  puts "Get on the #{@journey[:start_line]} line at #{@journey[:start_station]}"
  message = thru_stops
  if message != ''
    puts "Go through these stops on the #{@journey[:start_line]} line: #{message}"
  end
  puts "Get off at #{@journey[:stop_station]}"
  puts
end

def thru_stops
  line = @lines[@journey[:start_line]][:stops]
  start_index = line.find_index(@journey[:start_station])
  stop_index = line.find_index(@journey[:stop_station])
  if start_index > stop_index
    line.reverse!
    start_index = line.find_index(@journey[:start_station])
    stop_index = line.find_index(@journey[:stop_station])
  end
  trip = line[start_index..stop_index]
  trip.shift
  @journey[:trip_length] += trip.length
  trip.pop
  message = trip.join ', '
  return message
end

def total_trips
  puts "#{@journey[:trip_length]} stops in total."
  puts
end

def check_trip
  if @journey[:stop_station] == "Union Square"
    @journey[:stop_line] = @journey[:start_line]
  end
  if @journey[:start_line] == @journey[:stop_line] && @journey[:start_station] == @journey[:stop_station]
    already_there
  elsif @journey[:start_line] == @journey[:stop_line]
    single_line
  elsif @journey[:start_line] != @journey[:stop_line]
    two_lines
  end
end

def already_there
  puts "\e[H\e[2J"
  puts "You're already at your destination, you twit..."
  continue
end

def single_line
  puts "\e[H\e[2J"
  directions
  total_trips
  puts
  continue
end

def two_lines
  puts "\e[H\e[2J"
  @journey[:saved_line] = @journey[:stop_line]
  @journey[:saved_station] = @journey[:stop_station]
  @journey[:stop_line] = @journey[:start_line]
  @journey[:stop_station] = "Union Square"
  directions
  puts "Change trains at Union Square, maybe buy a paper or something while you wait like it's the 1930's. Extra extra, read all about it."
  puts
  @journey[:start_line] = @journey[:saved_line]
  @journey[:start_station] = "Union Square"
  @journey[:stop_line] = @journey[:saved_line]
  @journey[:stop_station] = @journey[:saved_station]
  directions
  total_trips
  continue
end

def continue
  print "Press 'enter' key to continue"
  input = gets
end

def main_menu
  puts "(a) - Create a journey"
  puts "(q) - Quit, like a quitter"
end

def show_map#
  puts "\e[H\e[2J"
  puts "          Times Square   34th   28th   23rd          Astor Place"
  puts "N line         *----------*------*------*         -------*"
  puts "                                          \\     \/"
  puts "                                           \\   \/"
  puts "              8th     6th              Union Square    3rd   1st"
  puts "L line         *-------*-------------------*****--------*-----*"
  puts "                                            \/ \\"
  puts "                                           \/   \\"
  puts "        Grand Central  33rd  28th  23rd   \/     \\       8th"
  puts "6 line       *----------*-----*-----*----         -------*"
  puts
  puts
  puts
end

def home
  show_map
  main_menu
  puts
  print "Please enter 'a' to create a journey or 'q' to quit: "
  choice = gets.chomp.downcase
  until choice == "q"
    case choice
    when 'a'
      get_journey
    end
    show_map
    main_menu
    puts
    print "Please enter 'a' to create a journey or 'q' to quit: "
    choice = gets.chomp.downcase
  end
  puts
  puts "Thanks for using the MTA-8000"
  puts
end

home
