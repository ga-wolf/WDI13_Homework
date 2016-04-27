# By counting the number of differences between two homologous DNA strands taken from different genomes with a common ancestor, we get a measure of the minimum number of point mutations that could have occurred on the evolutionary path between the two strands.
#
# This is called the 'Hamming distance'
#
# GAGCCTACTAACGGGAT
# CATCGTAATGACGGCCT
# ^ ^ ^  ^ ^    ^^
# The Hamming distance between these two DNA strands is 7.
#
# Write a program that can calculate the Hamming difference between two DNA strands.

@original = 'GAGCCTACTAACGGGAT'
@mutation = 'CATCGTAATGACGGCCT'

def count_hamming (str1, str2)
  hamming_count = 0
  for i in 0..str1.chars.length-1
    if str1.chars[i] != str2.chars[i]
      hamming_count += 1
    end
  end
  return hamming_count
end

puts "The hamming count between #{@original} and #{@mutation} is #{count_hamming(@original, @mutation)}"
