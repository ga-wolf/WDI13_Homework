# Write a program that converts a number to a string per the following rules:
#
# If the number contains 3 as a prime factor, output 'Pling'. If the number contains 5 as a prime factor, output 'Plang'. If the number contains 7 as a prime factor, output 'Plong'.
#
# If the number does not contain 3, 5, or 7 as a prime factor, simply return the string representation of the number itself.
#
# E.g.

##############################################################################

def get_input
print "Enter your number"
return_value = gets.to_i
end

def contains_factor(number, possible_factor)
number % possible_factor == 0
end

def main
number = get_input

if contains_factor number, 3
  puts "Pling"
end
if contains_factor number, 5
  puts "Plang"
end
if contains_factor number, 7
  puts "Plong"
end
if number % 3 != 0 && number % 5 != 0 && number % 7 != 0
  puts number
end
end
main

##############################################################################

def get_input
print "Enter your number"
return_value = gets.to_i
end

def contains_factor(number, possible_factor)
number % possible_factor == 0
end

def main
number = get_input
outputs = []
outputs.push("Pling") if contains_factor number, 3
outputs.push("Plang") if contains_factor number, 5
outputs.push("Plong") if contains_factor number, 7
outputs.push(number.to_s) if outputs.empty?
puts outputs.join(" ")
end
main

##############################################################################

def raindrops(number)

  str = ""

  str <<"pling" if number % 3 == 0
  str <<"plang" if number % 5 == 0
  str <<"plong" if number % 7 == 0

  return str unless str.empty?
  puts number.to_s.class

end

##############################################################################
