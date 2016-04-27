class RockpaperscissorsController < ApplicationController

  def pick
  end

  def result
    @value = params[:string].to_s
    @computermove  = ["rock", "paper", "scissors"].sample


    if (@value == "rock" && @computermove == "scissors") ||
       (@value == "paper" && @computermove == "rock") ||
       (@value == "scissors" && @computermove == "paper")

    @return = "Player chose" + @value + "computer chose" + @computermove + "You have Won"
  elsif
    (@value == "rock" && @computermove == "paper") ||
    (@value == "paper" && @computermove == "scissors") ||
    (@value == "scissors" && @computermove == "rock")
    @return = "Player chose" + @value + "computer chose" + @computermove + "You Lose"
  else
    @return = "Player chose" + @value + "computer chose" + @computermove + "Tie"
  end
end
end
