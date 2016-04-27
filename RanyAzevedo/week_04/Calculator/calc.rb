# Calculator
# Explanation
#
# You will be building a calculator. A calculator can perform multiple arithmetic operations. Your function should allow the user to choose which operation is expected, enter in the values to perform the operation on, and ultimately view the result.
# Specification:
#
# A user should be given a menu of operations
# A user should be able to choose from the menu
# A user should be able to enter numbers to perform the operation on
# A user should be shown the result
# This process should continue until the user selects a quit option from the menu
# Phase 1
#
# Calculator functionality
# Calculator should be able to do basic arithmetic (+,-, *, /)
# Phase 2
#
# Advanced Calculator functionality
# Calculator should be able to do basic arithmetic (exponents, square roots)
# Bonus
# Mortgage Calculator
#
# Calculate the monthly required payment given the other variables as input (look up the necessary variables)
#
# BMI Calculator
#
# Calculate the body mass index (BMI) for an individual, given their height and weight
#
# Trip Calculator
#
# Calculate a trip time and cost given inputs for
#
# distance
# miles per gallon
# price per gallon
# speed in miles per hour

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #

def main_menu
  puts"(b) - basic calculator"
  puts"(a) - advanced calculator"
  puts"(bmi) - body mass index"
  puts"(t) - trip calculator"
  puts"(m) - morgage"
  puts"(q) - quit"
end

def get_user_selection(message)
  print message
  gets.chomp
end

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #


# BASIC NUMBERS

def enterNumbers
  print 'first number: '
  @first_number = gets.chomp.to_i
  print 'second number: '
  @second_number = gets.chomp.to_i
end

# ADVANCED NUMBERS
def singleNumber
  print 'enter number: '
  @number = gets.chomp.to_i
end

#BMI
def kg_meters
  print "enter your weight in kg(ex 50): "
  @kg = gets.chomp.to_f
  print 'enter yout heigth in meters(ex: 1.60): '
  @meters = gets.chomp.to_f
end

# MORTAGE CALCULATOR

def mortage
  print "Enter the ammount in $: "
  @money = gets.chomp.to_i
  print "Enter the interest rate %: "
  @interest = gets.chomp.to_f/100
  print "Enter the loan period months: "
  @period = gets.chomp.to_i
end

# TRIP CALCULATOR

def trip
  print "Enter the distance in miles: "
  @distance = gets.chomp.to_f
  print "Enter the miles per gallon: "
  @miles_gallon = gets.chomp.to_f
  print "Enter the price per gallon: "
  @price_gallon = gets.chomp.to_f
  # print "Enter the speed in miles per hour: "
  # @miles_hour = gets.chomp.to_f
end

# - - - - - - - - - - - - - - - CALCULATORS - - - - - - - - - - - - - - - - - #

# BASIC CALCULATOR

def basic_calculator
  puts "(+) to sum"
  puts "(-) to sub"
  puts "(*) to mult"
  puts "(/) to div"
  puts "(q) to quit"
  print "Which operation would you like? "
  @operation = gets.chomp
end

# ADVANCED CALCULATOR

def advanced_calculator
  puts "(ex) to exponents "
  puts "(sr) to square roots "
  print "Which operation would you like? "
  @operation = gets.chomp
end


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #

main_menu
menu_choice = get_user_selection("Please enter your selection: ").downcase

until menu_choice == 'q'
  case menu_choice

# - - - - - - - - - - - - - - - BASIC CALCULATOR - - - - - - - - - - - - - - - #

when 'b'
  basic_calculator()
  enterNumbers()

  case @operation
  when '+'
    puts @first_number + @second_number
  when '-'
    puts @first_number - @second_number
  when '*'
    puts @first_number * @second_number
  when '/'
    puts @first_number / @second_number
  else
    puts 'Invalid'
end

# - - - - - - - - - - - - - - ADVANCED CALCULATOR - - - - - - - - - - - - - - #

when 'a'
  advanced_calculator()
  singleNumber()

  case @operation
  when 'ex'
    puts @number ** @number
  when 'sr'
    puts Math.sqrt(@number)
  else
    puts 'Invalid'
end

# - - - - - - - - - - - - - - MORTAGE CALCULATOR - - - - - - - - - - - - - - - #

when 'm'
  mortage()
  i = (1+ @interest/12) ** (12/12)-1
  d = (1 - (1/(1+i))** @period)/i
  payment = @money / d
puts "\n$%.2f per month" % [payment]


# - - - - - - - - - - - - - - - BODY MASS INDEX - - - - - - - - - - - - - - - #

when 'bmi'
  kg_meters()
  imc = @kg / (@meters * @meters)
  puts "\nYour BMI is %.2f per month" % [imc]
    # puts "You're underweight" if imc <= 18
    # puts "You're good" if imc < 24
    # puts "You're overweight" if imc > 25
    # puts "Obesity" if imc > 30

# - - - - - - - - - - - - - - - -TRIP CALCULATOR - - - - - - - - - - - - - - - #

when 't'
 trip()
 calc = (@distance / @miles_gallon) * @price_gallon
 puts "\nYour trip will cost $%.2f " % [calc]


# - - - - - - - - - - - - - - - - - - ELSE - - - - - - - - - - - - - - - - - - #

else
  puts "Invalid"
end

  main_menu
  menu_choice = get_user_selection("Please enter your selection: ").downcase
end
