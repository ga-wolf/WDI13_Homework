def main_menu
  puts "(b) - basic calculator"
  puts "(a) - advanced calculator"
  puts "(h) - bmi calculator"
  puts "(q) - quit"
end

def get_user_selection(message)
  print message
  gets.chomp
end


def basic_calculator
  puts "Please select whether you would like to [a]dd, [m]ultiply, [s]ubtract or [d]ivide"
  selection = gets.chomp

  num1 = get_user_selection("Please type your first number: ").to_i
  num2 = get_user_selection("Please type your second number: ").to_i

  case selection[0].downcase
  when 'a'
    puts "#{num1} + #{num2} = #{num1+num2} "
  when 'm'
    puts "#{num1} * #{num2} = #{num1*num2} "
  when 's'
    puts "#{num1} - #{num2} = #{num1-num2} "
  when 'd'
    puts "#{num1} / #{num2} = #{num1/num2} "
    # end
  end
end

def advanced_calculator
  puts "Please select whether you would like an [e]xponent or [s]quare root calculator"
  selection2 = gets.chomp

  case selection2[0].downcase
  when 'e'
    number1 = get_user_selection("Please type your first number: ").to_i
    number2 = get_user_selection("Please type your second number: ").to_i
    puts " #{number1} ** #{number2} = #{number1**number2} "
  when 's'
    number1 = get_user_selection("Please type the number you wish to calculate the square root of: ").to_i
    puts Math.sqrt(number1)
  end
end

def bmi_calculator
  puts "Welcome to the BMI calculator"

  weight = get_user_selection("Please enter your weight in KGs: ").to_f
  height = get_user_selection("Please enter your height in M: ").to_f

puts "#{weight} / (#{height} * #{height}) = #{weight/(height*height)}"


end
main_menu
menu_choice = get_user_selection("Please enter your selection: ").downcase

until menu_choice == 'q'
  case menu_choice
  when 'b'
    basic_calculator
  when 'a'
    advanced_calculator
  when 'h'
    bmi_calculator
  else
    puts "Invalid Selection"
  end

  main_menu
  menu_choice = get_user_selection("Please enter your selection: ").downcase
end
