# The N line has the following stops: Times Square, 34th, 28th, 23rd, Union Square, and 8th
# The L line has the following stops: 8th, 6th, Union Square, 3rd, and 1st
# The 6 line has the following stops: Grand Central, 33rd, 28th, 23rd, Union Square, and Astor Place.
require 'rainbow'
Trainline = {
"N" => ["Times Square", "34th", "28th", "23rd", "Union Square", "8th"],
"L" => ["8th", "6th", "Union Square", "3rd", "1st"],
"6" => ["Grand Central", "33rd", "28th", "23rd","Union Square", "Astor Place"],
}

# Trainline["L"][1] prints 6th
def get_input(l1, s1, l2, s2)

start_station = Trainline[l1].index(s1)
end_station = Trainline[l2].index(s2)

start_line = Trainline[l1]
end_line = Trainline[l2]

start_Us = Trainline[l1].index("Union Square")
end_Us = Trainline[l2].index("Union Square")


#SAME STATION
if l1 == l2 && s1 == s2
puts Rainbow("You are an idiot, go home.").orange
end
#SINGLE LINE TRIP
if l1 == l2 && s1 != s2
travels = Trainline[l1][start_station..end_station]
#SINGLE LINE REVERSE
if start_station > end_station
start_line.reverse!
travels = Trainline[l1][end_station..start_station]

elsif end_station < start_station
#SINGLE LINE FORWARD TRAVEL
travels = Trainline[l1][start_station..end_station]
end
puts "your journey starts on the #{l1} line at #{s1} station"
puts " you will travel through #{travels} to reach"
puts "your destination will then end on the #{l2} line at #{s2} station"
end


#
# MAKE SURE TO LIST THE AMOUNT OF STOPS
#

#TRAVELLING FORWARD ACCROSS LINES
if l1 != l2
travels_one = Trainline[l1][start_station..start_Us]
travels_two = Trainline[l2][end_station..end_Us]

# REVERSE Line1 to Union SQUARE
if start_station > start_Us
start_line.reverse!
travels_one = Trainline[l1][start_Us..start_station]
#TRAVELLING FORWARD ACCROSS LINE2
elsif start_station < start_Us
travels_one = Trainline[l1][start_station..start_Us]
end
# REVERSE Line2 to Union SQUARE
# FIX REVERSE FOR LINE 2
if end_station > end_Us
end_line.reverse!
travels_two = Trainline[l2][end_Us..end_station]
#TRAVELLING FORWARD ACCROSS LINE1
elsif end_station < end_Us
travels_two = Trainline[l2][end_station..end_Us]
end

end
puts "your journey starts on the #{l1} line at #{s1} station"
puts " you will travel through #{travels_one} to reach"
puts "Union Station. You will switch to #{l2}"
puts "From here you will travel through #{travels_two}"
puts "your destination will then end on the #{l2} line at #{s2} station"
end


require 'pry'
binding.pry

end

require 'pry'
binding.pry
