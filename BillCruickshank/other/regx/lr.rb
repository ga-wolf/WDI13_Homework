# [10] Make a program that prints each line of its input that mentions fred. (It shouldn’t do anything for other lines of input.) Does it match if your input string is Fred, frederick, or Alfred? Make a small text file with a few lines mentioning "fred flintstone" and his friends, then use that file as input to this program and the ones later in this section.

ARGF.each do |line|
  puts line if line /fred/
end

# [6] Modify the previous program to allow Fred to match as well. Does it match now if your input string is Fred, frederick, or Alfred? (Add lines with these names to the text file.)

ARGF.each do |line|
  puts line if line /[Ff]red/
end

# [6] Make a program that prints each line of its input that contains a period (.), ignoring other lines of input. Try it on the small text file from the previous exercise: does it notice Mr. Slate?

ARGF.each do |line|
  puts line if line /\./
end

# [8] Make a program that prints each line that has a word that is capitalized but not ALL capitalized. Does it match Fred but neither fred nor FRED?

ARGF.each do |line|
  puts line if line =~ /[A-Z][a-z]/
end

# [8] Make a program that prints each line that has a two of the same nonwhitespace characters next to each other. It should match lines that contain words such as Mississippi, Bamm-Bamm, or llama.

ARGF.each do |line|
  puts line if line =~ /\S?=/
end


# [8] Extra credit exercise: write a program that prints out any input line that mentions both wilma and fred.

ARGF.each do |line|
  puts line if line=~ /fred(.)*wilma/
end
