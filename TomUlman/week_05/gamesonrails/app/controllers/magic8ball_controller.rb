class Magic8ballController < ApplicationController

  def ask
  end

  def result
    @result  = ["It is certain", "I don't think so", "It is decidedly so", "Without a doubt", "Yes, definitely", "Reply hazy try again", "Ask again later", "Better not tell you now", "Don't count on it", "Cannot predict now", "Concentrate and ask again", "My reply is no", "Very doubtful", "My sources say no", "Outlook not so good"].sample
  end

end
