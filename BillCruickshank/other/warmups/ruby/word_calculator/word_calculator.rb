def get_input
  puts "Enter a calculation like 'What is 7 minus 5'."
  input = gets.chomp
  grouped_input = get_the_calculation input
  if grouped_input
    p do_the_calculation(grouped_input)
  else
    puts "I don't recognise that input, sorry."
  end
end

def get_the_calculation string
  flag = (string =~ /(-?\d+(\.\d+)?)\s+(.+)\s+(-?\d+(\.\d+)?)\s*(\??)/)
  if flag
    return [$1, $3, $4]
  else
    return nil
  end
end

def process_numeric string
  if string.include? '.'
    string.to_f
  else
    string.to_i
  end
end

def do_the_calculation array
  num1 = process_numeric(array[0])
  num2 = process_numeric(array[2])
  case array[1]
  when 'plus', 'added to', 'summed with'; num1 + num2
  when 'minus'; num1 - num2
  when 'subtracted from'; num2 - num1
  when 'by', 'multiplied by', 'times'; num1*num2
  when 'divided by'; num1/num2
  else "I saw your numbers, but I can't work out your calculation"
  end
end

get_input
