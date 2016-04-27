require 'rainbow'

def get_user_selection(message)
  print message
  gets.chomp
end

def add_numbers
  a = get_user_selection("First number: ").to_f
  b = get_user_selection("Second number: ").to_f
  puts Rainbow("#{a} + #{b} = #{a + b}").green
  basic_calculator_menu
end

def subtract_numbers
  a = get_user_selection("First Number: ").to_f
  b = get_user_selection("Second number: ").to_f
  puts Rainbow("#{a} - #{b} = #{a - b}").green
  basic_calculator_menu
end

def multiply_numbers
  a = get_user_selection("First Number: ").to_f
  b = get_user_selection("Second number: ").to_f
  puts Rainbow("#{a} * #{b} = #{a * b}").green
  basic_calculator_menu
end

def divide_numbers
  a = get_user_selection("First Number: ").to_f
  b = get_user_selection("Second number: ").to_f
  puts Rainbow("#{a} / #{b} = #{a / b}").green
  basic_calculator_menu
end

def advanced_exponent
  a = get_user_selection("Base: ").to_f
  b = get_user_selection("Exponent: ").to_f
  puts Rainbow("#{a} ^ #{b} = #{a ** b}").green
  advanced_calculator_menu
end

def advanced_square_root
  a = get_user_selection("Radicand: ").to_f
  puts Rainbow("Result: #{Math.sqrt(a)}").green
  advanced_calculator_menu
end

def bmi_calculator
  a = (get_user_selection("Enter height (cm): ").to_f)/100
  b = get_user_selection("Enter weight (kg): ").to_f
  bmi = (b / (a*a)).round(2)
  puts Rainbow("-------BMI Ranges-------\n Healthy: 18.5 - 24.9\n Underweight: Under 18.5\n Overweight: 25.0 - 29.9\n Your BMI is: #{bmi}").green
  main_menu
end

def trip_calculator
  distance = (get_user_selection("Enter distance (miles): ").to_f)
  mpg = (get_user_selection("Enter mpg: ").to_f)
  ppg = (get_user_selection("Enter price per gallon ($): ").to_f)
  mph = (get_user_selection("Enter speed (mph): ").to_f)
  trip_time = (distance / mph).round(2)
  trip_cost = ((distance/mpg)*ppg).round(2)
  puts Rainbow("Your trip will take #{trip_time} hours and cost #{trip_cost} dollars.").green
  main_menu
end


def advanced_calculator_menu
  puts "\n\n====Advanced Calculator===="
  puts "(e) -- Exponent"
  puts "(s) -- Square Root"
  puts "(b) -- Back to main menu"
  puts "==========================="
  menu_choice = get_user_selection("Please enter your selection: ").downcase
  until menu_choice == 'b'
    case menu_choice
    when "e"
      advanced_exponent
    when "s"
      advanced_square_root
    else
      puts Rainbow("Invalid Selection").red
    end
    main_menu
  end

end

def basic_calculator_menu
  puts "\n\n====Basic Calculator ===="
  puts "(a) -- Addition"
  puts "(s) -- Subtraction"
  puts "(m) -- Multiplication"
  puts "(d) -- Division"
  puts "(b) -- Back to main menu"
  puts "========================="
  menu_choice = get_user_selection("Please enter your selection: ").downcase
  until menu_choice == 'b'
    case menu_choice
    when "a"
      add_numbers
    when "s"
      subtract_numbers
    when "m"
      multiply_numbers
    when "d"
      divide_numbers
    else
      puts Rainbow(" ** Invalid Selection ** ").red
    end
  end
  main_menu
end

def main_menu
  puts "\n\n=========Main Menu========="
  puts "(b) -- Basic Calculator"
  puts "(a) -- Advanced Calculator"
  puts "(w) -- BMI Calculator"
  puts "(t) -- Trip Calculator"
  puts "(q) -- Quit"
  puts "==========================="
  menu_choice = get_user_selection("Please enter your selection: ").downcase
  until menu_choice == 'q'
    case menu_choice
    when 'b'
      basic_calculator_menu
    when 'a'
      advanced_calculator_menu
    when 'w'
      bmi_calculator
    when 't'
      trip_calculator
    else
      puts Rainbow(" ** Invalid Selection ** ").red
    end
  end
  exit
end

main_menu
