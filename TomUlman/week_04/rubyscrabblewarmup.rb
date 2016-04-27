# Letter                           Value
# A, E, I, O, U, L, N, R, S, T       1
# D, G                               2
# B, C, M, P                         3
# F, H, V, W, Y                      4
# K                                  5
# J, X                               8
# Q, Z                               10

# Your program should be in a file named scrabble.rb. You should be able to compute the score for any word entered by the user.



#BADGERS SOLUTION!
def score(word)
  sum = 0
  word.downcase.chars.each do |letter|
    @values.each do |k,v|
      if v.include?(letter)
        sum += k
      end
    end
  end
  sum
end

@values = {
  1 => %w(a e i o u l n r s t),
  2 => %w(d g),
  3 => %w(b c m p),
  4 => %w(f h v w y),
  5 => %w(k),
  8 => %w(j x),
  10 => %w(q z),
}

puts "welcome to scrabble - enter a word"
word = gets.chomp
puts score(word)



#FAIL!!!!!!!!!!!!!!

# def input_word(word)
# word.downcase
# wordscore = 0
# letters = word.split("")
# letters.each do |i|
# if i == ("a" || "e" || "i" || "o" || "u" || "l" || "n" || "r" || "s" || "t")
# wordscore += 1
# elsif i ==("d" || "g")
# wordscore += 2
# elsif i == ("b" || "c" || "m" || "p" )
# wordscore += 3
# elsif i == ("f" || "h" || "v" || "w" || "y")
# wordscore += 4
# elsif i == ("k")
# wordscore += 5
# elsif i == ("j" || "x")
# wordscore += 8
# elsif i == ("q" || "z")
# wordscore += 10
# end
# end
# puts wordscore
# end
# require 'pry'
# binding.pry
