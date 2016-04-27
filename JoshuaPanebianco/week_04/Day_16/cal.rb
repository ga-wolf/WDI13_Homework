def main_menu
 puts "(a) - addition"
 puts "(s) - subtraction"
 puts "(m) - muiltply"
 puts "(d) - divide"
 # puts "(a) - advanced calculator"
 # puts "(q) - quit"
end

def get_user_selection(message)
  print message
  gets.chomp
end

# def basic_calculator
#   puts "Basic calculator coming soon"
# end



def add(a, b)
 puts a + b
end

def subtract(a, b)
 puts a - b
end

def muiltply(a, b)
  puts a * b
end

def divide(a,b)
  puts a / b
end

  # rescue ExceptionName
  #
  # end

main_menu
selection = get_user_selection("Type in your selection ")

if selection === "a"
  print "addition"
  num1 = get_user_selection("What's the first number?").to_i
  num2 = get_user_selection("What's the second number?").to_i
  add(num1, num2)
elsif  selection === "s"
  print "subtraction"
  num1 = get_user_selection("What's the first number?").to_i
  num2 = get_user_selection("What's the second number?").to_i
  subtract(num1, num2)
elsif  selection === "m"
  print "muiltply"
  num1 = get_user_selection("What's the first number?").to_i
  num2 = get_user_selection("What's the second number?").to_i
  muiltply(num1, num2)
elsif  selection === "d"
  print "divide"
  num1 = get_user_selection("What's the first number?").to_i
  num2 = get_user_selection("What's the second number?").to_i
  divide(num1, num2)
end
