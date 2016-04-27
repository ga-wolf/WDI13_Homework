# Write a program that, given a word, computes the scrabble score for that word.
#
# scrabble.score("cabbage")
# # => 14
# Your program should be in a file named scrabble.rb. You should be able to compute the score for any word entered by the user.
#
# Letter Values
#
# Letter                           Value
# A, E, I, O, U, L, N, R, S, T       1
# D, G                               2
# B, C, M, P                         3
# F, H, V, W, Y                      4
# K                                  5
# J, X                               8
# Q, Z                               10
# Extensions
#
# You can play a :double or a :triple letter.
# You can play a :double or a :triple word.

letters = {
  1 => ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'],
  2 => ['D', 'G'],
  3 => ['B', 'C', 'M', 'P'],
  4 => ['F', 'H', 'V', 'W', 'Y'],
  5 => ['K'],
  8 => ['J', 'X'],
  10 => ['Q', 'Z']
}

print "What word do you want to check? "
word = gets.chomp.upcase
split_word = word.split ''
test_word = split_word.dup



print "Is the word on a double word score? (y or n) "
double = gets.chomp.upcase
if double != 'Y'
  double = 1
else double = 2
end

print "Is the word on a triple word score? (y or n) "
triple = gets.chomp.upcase
if triple != 'Y'
  triple = 1
else triple = 3
end

split_word.each do |l|
  print "Is the #{l} on a double letter? (y or n) "
  input = gets.chomp.upcase
  if input == 'Y'
    test_word.push l
  end
  print "Is the #{l} on a triple letter? (y or n) "
  input = gets.chomp.upcase
  if input == 'Y'
    test_word.push l
    test_word.push l
  end
end

score = 0

test_word.each do |l|
  letters.keys.each do |k|
    letter_score = letters[k].find_index(l)
    if letter_score != nil
      score += k.to_i
    end
  end
end

score = score * double * triple

puts "The score for #{word} is #{score} points."
