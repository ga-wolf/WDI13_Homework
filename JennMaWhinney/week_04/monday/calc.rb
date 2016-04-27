# # Calculator
# # Explanation
# #
# # You will be building a calculator. A calculator can perform multiple arithmetic operations. Your function should allow the user to choose which operation is expected, enter in the values to perform the operation on, and ultimately view the result.
# # Specification:
# #
# # A user should be given a menu of operations
# # A user should be able to choose from the menu
# # A user should be able to enter numbers to perform the operation on
# # A user should be shown the result
# # This process should continue until the user selects a quit option from the menu
# # Phase 1
# #
# # Calculator functionality
# # Calculator should be able to do basic arithmetic (+,-, *, /)
# # Phase 2
# #
# # Advanced Calculator functionality
# # Calculator should be able to do basic arithmetic (exponents, square roots)
#
# #choose which kind of calculator
def main_menu
  puts "(b) - basic calculator"
  puts "(a) - advanced calculator"
  puts "(q) - quit"
end
#
# #gets the users choice
def get_user_selection(message)
  print message
  gets.chomp
end

main_menu
menu_choice = get_user_selection("Please enter your selection: ").downcase
#
# # formula to get number choices and use within methods
def formula
  print "Enter first number: "
  @first_num = gets.chomp.to_f
  print "Enter second number: "
  @second_num = gets.chomp.to_f
end
# #filters user to correct calculator
#
# #until user quits go to the calculator of choice and run method
#
# case menu_choice
# when menu_choice == 'q'
#   main_menu
#   menu_choice = get_user_selection("Please enter your selection: ").downcase
# end
#   case menu_choice
  # when 'b'
    def basic_calculator
      print "Do you wish to add, subtract, multiply or divide?: "
      operation = gets.chomp.downcase

       if operation == "add"
        formula
        puts (@first_num + @second_num)
       elsif operation == "subtract"
        formula
        puts (@first_num - @second_num)
       elsif operation == "multiply"
        formula
        puts (@first_num * @second_num)
       elsif operation == "divide"
        formula
        puts (@first_num / @second_num)
      else
        puts "Invalid selection."
      end
  end

  basic_calculator

  puts "Thanks for using the worst calulator in history!"
# end
