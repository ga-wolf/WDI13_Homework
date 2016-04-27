def main_menu
 puts "(b) - basic calculator"
 puts "(a) - advanced calculator"
 puts "(bmi) - body mass index"
 puts "(t) - trip calculator"
 puts "(q) - quit"
end

def get_user_selection(message)
 print "Please enter your selection: "
 message = gets.chomp
end

def basic_calculator
#   Calculator functionality
puts "please tell me what you like to do: addition, subtraction, multiplication or division"
#   Calculator should be able to do basic arithmetic (+,-, *, /)
choice = gets.chomp.downcase
puts "Enter first number you would like to operate on: "
a = gets.to_i
puts "Enter second number you would like to operate on:"
b = gets.to_i

case choice
when "addition"
  add = a + b
  puts "a + b = #{add}"

when "subtraction"
  add = a - b
  puts "a - b = #{add}"

when "multiplication"
  add = a * b
  puts "a * b = #{add}"

when "division"
  add = a / b
  puts "a / b = #{add}"
else
  puts "Wrong Input"
end
end

 def advanced_calculator
# Advanced Calculator functionality
puts "Plaese enter what you would like to do: exponent or square"
# Calculator should be able to do basic arithmetic (exponents, square roots)
choice = gets.chomp.downcase

case choice
when "exponent"
  puts "Enter base number: "
  base = gets.to_i
  puts "Enter exponent: "
  exp = gets.to_i
  add = base**exp
  puts "num**exponent = #{add}"

when "square"
  puts "Enter a number you want the square root of: "
  sq = gets.to_i
  square = Math.sqrt(sq)
  puts "The square is: #{square}"
else
  puts "Wrong Input"
end
end

def body_mass_calculator
# div body weight in kg, by height in meters squared.
  puts "Please enter your height in m: "
  height = gets.to_f
  puts "Please enter your weight in kgs: "
  weight = gets.to_f
  hsquare = height*height
  bmi = weight/hsquare
  puts "Your BMI is #{bmi}"
end

def trip_calculator
# distance
# miles per gallon
# price per gallon
# speed in miles per hour
# d = rt. D stands for distance, r for rate and t for time.
# t = d/r

puts "Enter distance of trip:"
dist = gets.to_f
puts "Enter kilometers per litre:"
km = gets.to_f
puts "Enter speed per km/h:"
speed = gets.to_f
puts "Enter price per litre:"
price = gets.to_f

time = dist / speed
cost = dist * price

puts "The time it will take is: #{time} hours"
puts "The cost of the trip is $#{cost}"

end


main_menu
menu_choice = get_user_selection("Please enter your selection: ").downcase

until menu_choice == "q"
 case menu_choice
 when "b"
   basic_calculator
 when "a"
   advanced_calculator
 when "bmi"
   body_mass_calculator
 when "t"
   trip_calculator
 else
   puts "Invalid selection"
 end

 main_menu
 print "Please enter your selection: "
 menu_choice = gets.chomp.downcase
end
