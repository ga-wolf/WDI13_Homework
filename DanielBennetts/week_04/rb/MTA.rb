# # Which line it is
#   nLine
# # Where is the first stop
# startIndex = nLine.index "34th"
# # Where is the last stop
# end_index = nLine.index "8th"
# # Go through them
#   nLine.each do |station|
#     puts station
#   end
#   use ranges


  mta_lines = {
    "N" => ["Times Square", "34th", "28th-Nth", "23rd-Nth", "Union Square", "8th"],
    "L" => ["8th", "6th", "Union Square", "3rd", "1st"],
    "6" => ["Grand Central", "33rd", "28th-Sth", "23rd-Sth", "Union Square", "Astor Place"]
  }

puts "Which line would you like to start your journey on #{mta_lines.keys}? "
starting_line = gets.chomp.upcase

until mta_lines.keys.include?(starting_line) do
  puts "Wrong choice. You will need to enter one of the following: #{mta_lines.keys}"
  starting_line = gets.chomp.upcase
end
puts "You are starting your journey on the " + starting_line + " line "

puts "Which station would you like to get on at #{mta_lines[starting_line]}?"
starting_station = gets.chomp

until mta_lines[starting_line].include?(starting_station) do
  puts "Wrong choice. You will need to enter one of the following: #{mta_lines[starting_line]}"
  starting_station = gets.chomp
end
puts "You will be boarding your train at " + starting_station + " station, please keep your arms and legs inside the train at all times."

puts "Which line would you like to end your journey on #{mta_lines.keys}?"
ending_line = gets.chomp.upcase

until mta_lines.keys.include?(ending_line) do
  puts "Wrong choice. You will need to enter one of the following: #{mta_lines.keys}"
  ending_line = gets.chomp.upcase
end
puts "You will be ending your journey on the " + ending_line + " line "

puts "Which station would you like to disembark #{mta_lines[ending_line]}?"
ending_station = gets.chomp

until mta_lines[ending_line].include?(ending_station) do
  puts "Wrong choice. You will need to enter one of the following: #{mta_lines[ending_line]}"
ending_station = gets.chomp
end
puts "You will be getting off your train at " + ending_station + " station. Have a nice day."

start_index = mta_lines[starting_line].index(ending_station)
end_index = mta_lines[ending_line].index(starting_station)

intersection_one = mta_lines[starting_line].index('Union Square') - mta_lines[starting_line].index(starting_station)

intersection_two = mta_lines[ending_line].index(ending_station) -

if starting_line === ending_line
  distance = start_index - end_index
  journey_sum = distance.abs
  puts "It will be " + journey_sum.to_s + " stops before you reach your destination."
end
