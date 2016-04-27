
@stops1 = [];
@stops2 = [];

@lines = {
"n" => ['34th', '28thN', '23rdN', 'Union Square','8thN'],
"l" => ['8thL','6th','Union Square', '3rd','1st'],
"6" => ['Grand Central', '33rd', '28th6', '23rd6', 'Union Square', 'Astor Place']
}

print "Enter the line you are in (n, l , 6)? "
@first_line = gets.chomp
print "Enter the station you are: "
@initial_station = gets.chomp
print "Enter the line you want to go (n,l,6): "
@second_line = gets.chomp
print "Enter the station you want to go: "
@final_station = gets.chomp

# FROM initial_index TO  UNION SQUARE

def between_lines line, second_line
  initial_index = line.index(@initial_station)
  final_index = second_line.index(@final_station)
  union_first = line.index("Union Square")
  union_second = second_line.index("Union Square")

  #SAME LINE
  if @first_line == @second_line
    line[initial_index..final_index].each {|stops| @stops1 << stops }
    line[final_index..initial_index].reverse_each {|stops| @stops1 << stops }
    puts @stops1
    puts "Total of #{@stops1.length - 2} stops"
    puts "Trip Finished!"
    return
  end

  # FIRST LINE - FROM initial_index TO  UNION SQUARE
  if initial_index < union_first
    line[initial_index..union_first].each {|stops| @stops1 << stops}
  else
    line[union_first..initial_index].reverse_each {|stops| @stops1 << stops }
  end
    puts @stops1
    puts  "Change at Union Square"

  # SECOND LINE - FROM UNION SQUARE TO final_index
  if final_index < union_second
    second_line[final_index..union_second].reverse_each {|stops| @stops2 << stops }
  else
    second_line[union_second..final_index].each {|stops| @stops2 << stops}
  end
    puts @stops2
    puts " Total of #{@stops1.length + @stops2.length - 2} stops"
    puts "Trip Finished!"
end

between_lines @lines[@first_line], @lines[@second_line]
