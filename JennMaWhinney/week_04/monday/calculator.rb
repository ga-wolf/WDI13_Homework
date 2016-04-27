# Calculator
# Explanation
#
# You will be building a calculator. A calculator can perform multiple arithmetic operations.
# Your function should allow the user to choose which operation is expected, enter in the values to perform the operation on,
# and ultimately view the result.
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
# Phase 3
#
# User should be given a menu of Calculator functionality
# User should be able to choose intended functionality

def main_menu
  puts "(b) - basic calculator"
  puts "(a) - advanced calculator"
  puts "(q) - quit"
end

def get_user_selection(message)
  print message
  gets.chomp
end

def basic_calculator
  puts "Basic calculator coming soon"
end

# def basic_calculator
#   print "Would you like to add, subtract, multiply or divide?: "
#   response = gets.chomp
#   case response
#   when "add"
#     print "which numbers would you like to add?: "
#     nums = gets[]
#
# end

# main_menu
# menu_choice = get_user_selection("Please enter your selection: ").downcase
#
# until menu_choice == 'q'
#   case menu_choice
#   when 'b'
#     basic_calculator
#   else
#     puts "Invalid selection"
#   end
#
#   main_menu
#   menu_choice = get_user_selection("Please enter your selection: ").downcase
# end
