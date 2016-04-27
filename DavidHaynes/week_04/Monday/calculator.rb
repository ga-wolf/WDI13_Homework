# Calculator
# Explanation
#
# You will be building a calculator. A calculator can perform multiple arithmetic operations.
# Your function should allow the user to choose which operation is expected,
# enter in the values to perform the operation on, and ultimately view the result.
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
# Bonus
# Mortgage Calculator
#
# Calculate the monthly required payment given the other variables as input
# (look up the necessary variables)
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
  puts "Main Menu"
  puts "(a) - Basic calculator"
  puts "(b) - Advanced calculator"
  puts "(c) - Special calculators"
  puts "(q) - Quit"
end

def basic_calc_menu
  puts "Basic Calculator Menu"
  puts "(+) - Addition"
  puts "(-) - Subtraction"
  puts "(*) - Multiplication"
  puts "(/) - Division"
  puts "(r) - Return to Main Menu"
end

def advanced_calc_menu
  puts "Advanced Calculator Menu"
  puts "(^) powers of/ exponents"
  puts "(s) square roots"
  puts "(r) return to Main Menu"
end

def special_calc_menu
  puts "Mortgage Calculator Menu"
  puts "(a) Mortgage Calculator"
  puts "(b) Body Mass Index Calculator"
  puts "(c) Trip Calculator"
  puts "(r) Return to Main Menu"
end

#//////////////////////////////////////////////////////////////////////////
def main_menu_selection
  print "Please select from the Main Menu: "
  gets.chomp.downcase
end

def basic_calc_selection
  print "Please select from the Basic Calculator Menu: "
  @operation = gets.chomp.downcase
end

def advanced_calc_selection
  puts "Please select from the Advanced Calculator Menu: "
  @operation = gets.chomp.downcase
end

def special_calc_selection
  puts "Please select from the Special Calculator Menu: "
  @operation = gets.chomp.downcase
end

#//////////////////////////////////////////////////////////////////////////

def number
  print "Please enter a number: "
  @first_num = gets.to_i
end

def numbers
  print "Please enter the first number: "
  @first_num = gets.to_i
  print "Please enter the second number: "
  @second_num = gets.to_i
end

#//////////////////////////////////////////////////////////////////////////

def basic_calculator_operations
  case @operation
  when '+'
    @first_num + @second_num
  when '-'
    @first_num - @second_num
  when '*'
    @first_num * @second_num
  when '/'
    @first_num / @second_num
  end
end

def advanced_calculator_operations
  case @operation
  when '^'
    @first_num ** @second_num
  when "s"
    Math.sqrt(@first_num)
  end
end

def mortgage_calculator_operations
    print "Please enter your principal amount: "
    @principal = gets.to_i
    print "How many years will the loan go for: "
    @year = gets.to_i
    print "What is the loan rate (%): "
    @rate = gets.to_i
    print "repay (w)eekly, (f)ortnightly or (m)ontly: "
    @period = gets.downcase[0]
    if @period == 'w'
        @rate_period = @rate/100.0/52.0
        periodPrint = 'weekly'
        periods = @year * 52
    elsif @period == 'f'
        @rate_period = @rate/100.0/26.0
        periodPrint = 'fortnightly'
        periods = @year * 26
    elsif @period == 'm'
        @rate_period = @rate/100.0/12.0
        periodPrint = 'monthly'
        periods = @year * 12
    end
    numerator = @rate_period * ((@rate_period + 1) ** periods)
    denominator = ((@rate_period + 1) ** periods) - 1
    result = @principal * numerator / denominator
    puts "The #{periodPrint} repayments on a loan of $#{@principal} at #{@rate}% over #{@year} years is $#{result.round(2)}"
end

def bmi_calculator_operations
    print "Please enter your Height (cm): "
    height = gets.to_i
    print "Please enter your Weight (kg): "
    weight = gets.to_i
    result = weight / ((height/100) ** 2)
    puts "Your BMI is #{result}"
end

def trip_calculator_operations
    print "Please enter your distance in km: "
    distance = gets.to_f
    print "Please enter your vehicles km's per L: "
    fuel_use = gets.to_f
    print "Pleae enter the price ($) per litre(L): "
    price = gets.to_f
    print "Pleae enter the speed in km/h: "
    speed = gets.to_f
    triptime = distance / speed
    tripcost = distance / fuel_use * price
    puts "A trip of #{distance}km's at a speed of #{speed}km/h will take #{triptime.round(2)} hr's and cost you $#{tripcost.round(2)}"
end

#//////////////////////////////////////////////////////////////////////////

def basic_calc
  basic_calc_menu
  first_selection = basic_calc_selection
  until first_selection == 'r'
    numbers
    result = basic_calculator_operations
    puts " #{ @first_num } #{ @operation } #{ @second_num }  =  #{ result } "
    first_selection = basic_calc_selection
  end
  main_menu
  @main_selection = main_menu_selection
end

def advanced_calc
  advanced_calc_menu
  first_selection = advanced_calc_selection
  until first_selection == 'r'
    if first_selection == "^"
      numbers
      result = advanced_calculator_operations
      puts " #{@first_num} to the power of #{ @second_num } =  #{ result } "
    elsif first_selection == "s"
      number
      result = advanced_calculator_operations
      puts " The square root of #{ @first_num }  =  #{ result } "
    end
    first_selection = advanced_calc_selection
  end
  main_menu
  @main_selection = main_menu_selection
end

def special_calc
  special_calc_menu
  first_selection = special_calc_selection
  until first_selection == 'r'
      if first_selection == 'a'
          mortgage_calculator_operations
      elsif first_selection == 'b'
          bmi_calculator_operations
      elsif first_selection == 'c'
          trip_calculator_operations
      end
      first_selection = special_calc_selection
  end
  main_menu
  @main_selection = main_menu_selection
end

#//////////////////////////////////////////////////////////////////////////

main_menu
@main_selection = main_menu_selection
until @main_selection == 'q'
  case @main_selection
  when "a" then basic_calc
  when "b" then advanced_calc
  when "c" then special_calc
  end
end
