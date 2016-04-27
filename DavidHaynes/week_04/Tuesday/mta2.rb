################################################################################

@subway = {  :n_line => ['Times Square', '34th', '28thN', '23rdN', 'Union Square', '8thN'],
            :l_line => ['8thL', '6th', 'Union Square', '3rd', '1st'],
            :six_line => ['Grand Central', '33rd', '28th6', '23rd6', 'Union Square', 'Astor Place']
        }

################################################################################

print "Please enter your origin: "
ORIGIN = gets.chomp
print "Please enter your destination: "
DESTINATION = gets.chomp

################################################################################

def what_line (station)
        lines = [];
        @subway.each do |line, _|
                lines << line if @subway[line].include? station
        end
        lines
end

################################################################################

@origin_line = what_line(ORIGIN)
@destination_line = what_line(DESTINATION)
@origin_index = @subway[@origin_line[0]].index ORIGIN
@union_origin_index = @subway[@origin_line[0]].index "Union Square"
@destination_index = @subway[@destination_line[0]].index DESTINATION
@union_destination_index = @subway[@destination_line[0]].index "Union Square"
@first_leg = []
@second_leg = []

################################################################################
#check if one of the stations is Union Square
if    @origin_index == @union_origin_index
            @origin_line = @destination_line
elsif @destination_index == @union_destination_index
            @destination_line = @origin_line
end

#check if the same line i.e. no change at Union Square
if @origin_line == @destination_line
      @union_origin_index = @destination_index
end

if @origin_index <= @union_origin_index
      @first_leg.push(@subway[@origin_line[0]][(@origin_index + 1)..@union_origin_index].flatten)
else  @first_leg.push(@subway[@origin_line[0]][@union_origin_index..(@origin_index - 1)].flatten.reverse)
end


if @destination_index <= @union_destination_index && @origin_line != @destination_line
      @second_leg.push(@subway[@destination_line[0]][@destination_index..(@union_destination_index - 1)].flatten.reverse)
else  @second_leg.push(@subway[@destination_line[0]][(@union_destination_index + 1)..@destination_index].flatten)
end

@first_leg.flatten!
@second_leg.flatten!
@total_num_stations = @first_leg.length + @second_leg.length

################################################################################

puts "Begining at #{ORIGIN} on the #{@origin_line.to_s} you will travel #{@first_leg.length} stops: "
puts @first_leg.join ", "
if @second_leg.length > 0
      puts "Then you will change at Union Square and join the #{@destination_line.to_s} line"
      puts "There you will travel a further #{@second_leg.length} stops: "
end
if @second_leg.length > 1
      puts @second_leg.join ", "
end
puts "To your destination: #{DESTINATION}"
puts "This is a total of #{@total_num_stations} stops."
puts "Have a great trip!"
