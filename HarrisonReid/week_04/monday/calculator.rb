def main_menu
  print_main_menu
  menu_choice = get_user_selection("Please enter your selection: ").downcase
  until menu_choice == "q"
    case menu_choice
    when "b"
      basic_calculator
    when "a"
      advanced_calculator
    when "t"
      trip_calculator
    else
      puts "Invalid selection"
    end
    print_main_menu
    menu_choice = get_user_selection("Please enter your selection: ").downcase
  end
end

def print_main_menu
  puts "\nTHE CALCULATOR\n=============="
  puts "(b) - basic calculator"
  puts "(a) - advanced calculator"
  puts "(t) - trip calculator"
  puts "(q) - quit"
  puts "\n"
end

def get_user_selection(message)
  print message
  gets.chomp
end

def basic_calculator
  print_basic_calculator_menu
  basic_choice = get_user_selection("Please enter your selection: ").downcase
  until basic_choice == "<"
    case basic_choice
    when "a"
      addition
    when "s"
      subtraction
    when "m"
      multiplication
    when "d"
      division
    else
      puts "Invalid selection. Please select again."
    end
    print_basic_calculator_menu
    basic_choice = get_user_selection("Please enter your selection: ").downcase
  end
end

def advanced_calculator
  print_advanced_calculator_menu
  advanced_choice = get_user_selection("Please enter your selection: ").downcase
  until advanced_choice == "<"
    case advanced_choice
    when "e"
      exponent
    when "sq"
      square
    when "sr"
      square_root
    else
      puts "Invalid selection. Please select again."
    end
    print_advanced_calculator_menu
    advanced_choice = get_user_selection("Please enter your selection: ").downcase
  end
end

def print_basic_calculator_menu
  puts "\nBASIC CALCULATOR\n=============\n"
  puts "(a) - addition"
  puts "(s) - subtract"
  puts "(m) - multilplication"
  puts "(d) - division"
  puts "(<) - previous menu"
  puts "\n"
end

def print_advanced_calculator_menu
  puts "\nADVANCED CALCULATOR\n=============\n"
  puts "(e) - exponent"
  puts "(sq) - square"
  puts "(sr) - square root"
  puts "(<) - previous menu"
  puts "\n"
end

def addition
  print "Please enter the first number: "
  first_num = gets.to_f
  print "Please enter the second number: "
  second_num = gets.to_f
  result = first_num + second_num
  print "#{first_num} + #{second_num} = #{result}\n"
end

def subtraction
  print "Please enter the number to subtract from: "
  first_num = gets.to_f
  print "Please enter the number to subtract: "
  second_num = gets.to_f
  result = first_num - second_num
  print "#{first_num} - #{second_num} = #{result}\n"
end

def multiplication
  print "Please enter the first number: "
  first_num = gets.to_f
  print "Please enter the second number: "
  second_num = gets.to_f
  result = first_num * second_num
  print "#{first_num} x #{second_num} = #{result}\n"
end

def division
  print "Please enter the number to divide: "
  first_num = gets.to_f
  print "Please enter the number to divide by: "
  second_num = gets.to_f
  result = first_num * second_num
  print "#{first_num} / #{second_num} = #{result}\n"
end

def exponent
  print "Please enter the base: "
  first_num = gets.to_f
  print "Please enter the exponent: "
  second_num = gets.to_f
  result = first_num ** second_num
  print "#{first_num}^#{second_num} = #{result}\n"
end

def square
  print "Please enter the number to square:"
  first_num = gets.to_f
  result = first_num ** 2
  print "#{first_num}^2 = #{result}\n"
end

def square_root
  print "Please enter the radicand: "
  first_num = gets.to_f
  result = Math.sqrt(first_num)
  print "Square root of #{first_num} = #{result}\n"
end

def trip_calculator
  print "Please enter the distance in miles: "
  distance = gets.to_f
  print "Please enter the miles/gallon: "
  mpg = gets.to_f
  print "Please enter the price/gallon in dollars: "
  ppg = gets.to_f
  print "Please enter the speed in miles/hour: "
  mph = gets.to_f
  trip_time = distance / mph
  cost = (distance / mpg) * ppg
  print "Your trip will take a total of #{trip_time} hours, at a cost of $#{cost}.\n"
end


main_menu
