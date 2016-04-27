def basic_calculator
  print "Add, subtract, multiply or divide?"
  operation = gets.chomp.downcase

def formula
  print "Enter first number: "
  first_num = gets.chomp.to_i
  print "Enter second number: "
  second_num = gets.chomp.to_i
end

   if operation == "add"
    formula
    puts (first_num + second_num)

   elsif operation == "subtract"
    formula
    puts (first_num - second_num)

   elsif condition
     operation == "multiply"
    formula
    puts (first_num * second_num)

   elsif condition
     operation == "divide"
    formula
    puts (first_num / second_num)

  else
    puts "Invalid selection."

end
end
