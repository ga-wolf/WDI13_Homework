require 'rainbow'

LINES = {
  "N" => ["TIMES SQUARE", "34TH", "28TH", "23RD", "UNION SQUARE", "8TH"],
  "L" => ["8TH", "6TH", "UNION SQUARE", "3RD", "1ST"],
  "6" => ["GRAND CENTRAL", "33RD", "28TH", "23RD", "UNION SQUARE", "ASTOR PLACE"],
}

def get_user_input(message)
  print message
  gets.chomp
end

def get_stops_in_order(line_array, start, stop)
  line_array.reverse! if line_array.index(start) > line_array.index(stop)
  line_array[line_array.index(start)..line_array.index(stop)]
end

def print_trip_summary(departure_line, departure_station, arrival_line, arrival_station)
  if departure_line == arrival_line && departure_station == arrival_station
    puts Rainbow("You are already at your destination.").red
  elsif departure_line == arrival_line
    trip = get_stops_in_order(LINES[departure_line], departure_station, arrival_station)
    puts Rainbow("You must travel through the following stops on the #{departure_line} line: #{trip.join(', ')}.").green
    puts Rainbow("Your trip consisted of a total of #{trip.count} stops.").green
  else
    trip_one = get_stops_in_order(LINES[departure_line], departure_station, "UNION SQUARE")
    trip_two = get_stops_in_order(LINES[arrival_line], "UNION SQUARE", arrival_station)
    trip_two.shift
    station_count = trip_one.count + trip_two.count
    puts Rainbow("You must travel through the following stops on the #{departure_line} line: #{trip_one.join(", ")}.").green
    puts Rainbow("Change at Union Square to the #{arrival_line} line.").green
    puts Rainbow("Your journey continues through the following stops: #{trip_two.join(", ")}.").green
    puts Rainbow("#{station_count} stops in total.").green
  end
end

def get_line(message)
  line = get_user_input(message).upcase
  until LINES.key?(line)
    puts Rainbow("That's not a real train line, please try again").red
    line = get_user_input(message).upcase
  end
  line
end

def get_station(line, message)
  station = get_user_input(message).upcase
  until LINES[line].include?(station)
    puts Rainbow("That station doesn't exist on the given line, please try again.").red
    station = get_user_input(message).upcase
  end
  station
end

def run_trip_planner
  puts "\n"
  puts Rainbow("----- TRIP PLANNER -----").green
  puts Rainbow("========================").green
  departure_line = get_line(Rainbow("Please enter your departure line: ").yellow)
  departure_station = get_station(departure_line, Rainbow("Please enter your departure station: ").yellow)
  arrival_line = get_line(Rainbow("Please enter your arrival line: ").yellow)
  arrival_station = get_station(arrival_line, Rainbow("Please enter your arrival station: ").yellow)
  print_trip_summary(departure_line, departure_station, arrival_line, arrival_station)
end

run_trip_planner
