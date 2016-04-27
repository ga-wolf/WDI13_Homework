# DNA is represented by an alphabet of the following symbols: 'A', 'C', 'G', and 'T'.
#
# Each symbol represents a nucleotide, which is a fancy name for the particular molecules that happen to make up a large part of DNA.
#
# Write a program that will tell you how many times each nucleotide occurs in a string.
#

require 'pry'

print "What is the string you want to check for nucleotides? "
input_string = gets.upcase.chomp.chars

nucleotides = %w(A C G T)

# nucleotides = ['A','C','G','T']
nuk_list = []

nuk_count = {
  :A => 0,
  :C => 0,
  :G => 0,
  :T => 0
}

input_string.each do |i|
  nucleotides.each do |n|
    if i == n
      nuk_list.push n
    end
  end
end

nuk_list.each do |l|
  case l
  when "A" then nuk_count[:A] += 1
  when "C" then nuk_count[:C] += 1
  when "G" then nuk_count[:G] += 1
  when "T" then nuk_count[:T] += 1
  end
end

nuk_count.each do |k,v|
  puts "The number of #{k} is #{v}"
end
