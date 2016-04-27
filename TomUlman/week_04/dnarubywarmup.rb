# DNA is represented by an alphabet of the following symbols: 'A', 'C', 'G', and 'T'.
#
# Each symbol represents a nucleotide, which is a fancy name for the particular molecules that happen to make up a large part of DNA.
#
# Shortest intro to biochemistry EVAR:
#
# twigs are to birds nests as
# nucleotides are to DNA and RNA as
# amino acids are to proteins as
# sugar is to starch as
# oh crap lipids
# I'm not going to talk about lipids because they're crazy complex.
#
# So back to DNA.
#
# Write a program that will tell you how many times each nucleotide occurs in a string.
#


#find a c g t in a string and count them

def dna_test(input)

word_test = input.downcase
count_a = 0
count_c = 0
count_g = 0
count_t = 0

## word_test is
word_test.chars.each do |i|
  if i.include? "a"
count_a += 1
  elsif i.include? "c"
count_c += 1
elsif i.include? "g"
count_g += 1
  elsif i.include? "t"
count_t += 1
end
# puts "there are " + count_c.to_s + "C's"
# puts "there are " + count_g.to_s + "G's"
# puts "there are " + count_t.to_s + "AT's"
end
puts "there is #{count_a} A"
puts "there is #{count_c} C"
puts "there is #{count_g} G"
puts "there is #{count_t} T"

end
dna_test("bacon")


 #BADGER SOLUTION
# def counter(string)
#   string.chars.each do |c|
#     if @valid.include?(c)
#       @counts[c] += 1
#     else
#       @msg << "#{c} is not a valid nucleotide\n"
#     end
#   end
# end
#
# def results
#   @counts.each do |k,v|
#     puts "#{k} appears #{v} time#{plural(v)}in the strand\n"
#   end
# end
#
# def plural(num)
#   if (num > 1) || (num == 0)
#     return "s "
#   else
#     return " "
#   end
# end
#
# @valid = %w(A C G T)
#
# @counts = {
#   "A" => 0,
#   "C" => 0,
#   "G" => 0,
#   "T" => 0
# }
#
# @msg = ""
#
# puts "Give me a strand of nucleotides"
# nuc = gets.chomp
# counter(nuc)
# results
# puts @msg
