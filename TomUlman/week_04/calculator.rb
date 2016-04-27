# add rainbow gem (adds colour changes)
# Ruby lang docs
# Pry video doc
# Ruby Monk

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
# Phase 3
#
# User should be given a menu of Calculator functionality
# User should be able to choose intended functionality

require 'rainbow'

def main_menu
  puts "(b) - basic calculator"
  puts "(a) - advanced calculator"
  puts "(bmi) - bmi calculator"
  puts "(q) - quit"
end

def get_user_selection(message)
  print message
  gets.chomp
end

def number1(n1)
  puts "Select your first number"
  n1 = gets.to_i
end

def basic_calculator
  puts "Please select your operation"
  puts "(a) - addition"
  puts "(s) - subtraction"
  puts "(m) - multiplication"
  puts "(d) - division"
  puts "(q) - quit"
  basic_choice = get_user_selection("Please enter your selection:").downcase

  until basic_choice == "q"
    case basic_choice
    when 'a'
      n1 = get_user_selection("Please enter your first number:").to_i
      n2 = get_user_selection("Please enter your second number:").to_i
      sum = n1 + n2
    when 's'
      n1 = get_user_selection("Please enter your first number:").to_i
      n2 = get_user_selection("Please enter your second number:").to_i
      sum = n1 - n2
    when 'm'
      n1 = get_user_selection("Please enter your first number:").to_i
      n2 = get_user_selection("Please enter your second number:").to_i
      sum = n1 * n2
    when 'd'
      n1 = get_user_selection("Please enter your first number:").to_i
      n2 = get_user_selection("Please enter your second number:").to_i
      sum = n1 / n2
    else puts "Invalid selection"
    end
    print Rainbow("The answer is ").blue
    print Rainbow(sum).red
    puts ".\n"
    puts basic_calculator
    basic_choice = get_user_selection("Please enter your selection:").downcase

  end
end


def advanced_calculator
  puts "Please select your operation"
  puts "(e) - exponents"
  puts "(r) - square root"
  puts "(q) - quit"
  advanced_choice = get_user_selection("Please enter your selection:").downcase

  until advanced_choice == "q"
    case advanced_choice
    when 'e'
      n1 = get_user_selection("Please enter your first number:").to_i
      n2 = get_user_selection("Please enter your second number:").to_i
      sum = n1 ** n2
    when 'r'
      n1 = get_user_selection("Please enter your number:").to_i
      sum = Math.sqrt(n1)
    else puts "Invalid selection"
    end
    print Rainbow("The answer is ").blue
    print Rainbow(sum).red
    puts ".\n"
    puts advanced_calculator
    advanced_choice = get_user_selection("Please enter your selection:").downcase
  end
end


# divide your weight in kilograms (kg) by your height in metres (m)
# then divide the answer by your height again to get your BMI.
def bmi
  puts "Please select your operation"
  puts "(s) - start"
  puts "(q) - quit"
  bmi_choice = get_user_selection("Please enter your selection:").downcase

  until bmi_choice == "q"
    case bmi_choice
    when 's'
      n1 = get_user_selection("Please enter your weight in kg:").to_i
      n2 = get_user_selection("Please enter your height in metres:").to_i
      sum = (n1 / n2) /n1
    else puts "Invalid selection"
    end
    print Rainbow("The answer is ").blue
    print Rainbow(sum).red
    puts ".\n"
    puts bmi
    bmi_choice = get_user_selection("Please enter your selection:").downcase
  end
end

main_menu
menu_choice = get_user_selection("Please enter your selection:").downcase

until menu_choice == "q"
  case menu_choice
  when 'b'
    basic_calculator
  when 'a'
    advanced_calculator
  when 'bmi'
    bmi
  else puts "Invalid selection"
  end

  main_menu
  menu_choice = get_user_selection("Please enter your selection:").downcase
end
