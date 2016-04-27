# Calculator
# Explanation

# You will be building a calculator. A calculator can perform multiple arithmetic operations. Your function should allow the user to choose which operation is
# expected, enter in the values to perform the operation on, and ultimately view the result.

# Specification:
# A user should be given a menu of operations
# A user should be able to choose from the menu
# A user should be able to enter numbers to perform the operation on
# A user should be shown the result
# This process should continue until the user selects a quit option from the menu

# Phase 1
# Calculator functionality
# Calculator should be able to do basic arithmetic (+,-, *, /)

# Phase 2
# Advanced Calculator functionality
# Calculator should be able to do basic arithmetic (exponents, square roots)

# Phase 3
# User should be given a menu of Calculator functionality
# User should be able to choose intended functionality

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



def main_menu
  puts "(b) - basic calculator"
  puts "(a) - advanced calculator"
  puts "(bmi) - BMI calculator"
  puts "(m) - mortgage calculator"
  puts "(t) - trip calculator"
  puts "(q) - quit"
end

def get_user_selection(message)
  print message
  gets.chomp
end

def basic_calculator
  operator = get_user_selection("Select the operator you want to use: (+, -, * or /) ")
  first_num = get_user_selection("Enter the first number in your #{ operator } calculation ")
  second_num = get_user_selection("Enter the second number in your #{ operator } calculation ")

  case operator
  when "+"
    puts (first_num.to_i + second_num.to_i)
  when "-"
    puts (first_num.to_i - second_num.to_i)
  when "*"
    puts (first_num.to_i * second_num.to_i)
  when "/"
    puts (first_num.to_i / second_num.to_i)
  end
end

def advanced_calculator
  operator = get_user_selection("Select the operator you want to use: (exponent or square root) ")
  if operator == "exponent"
    first_num = get_user_selection("Enter the number to apply an exponent to: ")
    exponent_num = get_user_selection("Enter exponent number: ")

    puts (first_num.to_i ** exponent_num.to_i)

  elsif operator == "square root"
    square_root_num = get_user_selection("Enter the number to square root: ")

    puts ( Math.sqrt(square_root_num.to_i))
  end
end

def mortgage_calculator
  principal = get_user_selection("Enter the value to your mortgage loan (i.e. principal): ")
  annual_interest_rate = get_user_selection("Enter the value of your annual interest rate as a decimal (e.g. 6% = 0.06): ")
  term_years = get_user_selection("Enter the value of your loan term in years: ")
  monthly_interest_rate = (annual_interest_rate.to_f / 12)
  term_months = (term_years.to_i * 12)

  puts (principal.to_i((monthly_interest_rate(1 + monthly_interest_rate)) ** term_months) / (((1 + monthly_interest_rate) ** term_months) - 1))
end

def bmi_calculator
  weight = get_user_selection("Enter your weight in kg: ")
  height = get_user_selection("Enter your height in meters: ")

  puts "Your BMI is #{(weight.to_i / Math.sqrt( height.to_f )).round(2)}kg/m2"
end

def trip_calculator
  # time = distance(miles)/speed(miles/hr)
  # cost = distance(miles)/miles/gallon x cost/gallon
  distance = get_user_selection("Enter the total trip distance in miles:  ")
  miles_per_gallon = get_user_selection("Enter the total miles per gallon of fuel used:  ")
  price_per_gallon = get_user_selection("Enter the total price of fuel per gallon:  ")
  speed_per_hour = get_user_selection("Enter the speed in miles per hour travelled:  ")

  puts "Your trip will take #{(distance.to_f / speed_per_hour.to_i).round(2)} hours."
  puts "Your trip will cost $#{((distance.to_i / miles_per_gallon.to_f) * price_per_gallon.to_f).round(2)}."
end

main_menu
menu_choice = get_user_selection("Please enter your selection: ").downcase

until menu_choice == 'q'
  case menu_choice
  when 'b'
    basic_calculator
  when 'a'
    advanced_calculator
  when 'bmi'
    bmi_calculator
  when 'm'
    mortgage_calculator
  when 't'
    trip_calculator
  else
    puts "Invalid selection"
  end

  main_menu
  menu_choice = get_user_selection("Please enter your selection: ").downcase
end
