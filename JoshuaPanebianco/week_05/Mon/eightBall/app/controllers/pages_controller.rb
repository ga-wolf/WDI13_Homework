class PagesController < ApplicationController

  def home
  end

  def number
    @something = "aohrgohsoergh"

  end

  def secret_number
  end

  def paper
  end

 def result
   possibilities = [
     "It is certain",
     "It is decidedly so",
     "Without a doubt",
     "Yes, definitely",
     "You may rely on it",
     "As I see it, yes",
     "Most likely",
     "Outlook good",
     "Yes",
     "Signs point to yes",
     "Reply hazy try again",
     "Ask again later",
     "Better not tell you now",
     "Cannot predict now",
     "Concentrate and ask again",
     "Don't count on it",
     "My reply is no",
     "My sources say no",
     "Outlook not so good",
     "Very doubtful"
   ]
   @answer = possibilities.sample

 end

 def secret
    number_pick = rand(1..10)  #["one","two","three","four","five","six","seven","eight","nine","ten"]

   @secret = number_pick.sample

  #  if (@secret === guess )
  # alert("Congrats You picked the number")
  # else
  # alert("Sorry pick another number")
  # end
 end

end
