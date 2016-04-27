class RockscissorspaperController < ApplicationController
  def home
  end

  def result
    # raise
    @player = params[:player]


    options = ["rock", "scissors", "paper"]
    random = Random.rand(0..2)
    @computer = options[random]

    @result = case @player
    when "rock"
      case @computer
      when "rock" then "tie"
      when "scissors" then "player"
      when "paper" then "computer"
      end
    when "scissors"
      case @computer
      when "rock" then "computer"
      when "scissors" then "tie"
      when "paper" then "player"
      end
    when "paper"
      case @computer
      when "rock" then "player"
      when "scissors" then "computer"
      when "paper" then "tie"
      end
    end

    @result_message = case @result
    when "player" then "You win!! How thrilling."
    when "computer" then "You lose!! Oh well."
    when "tie" then "Tie! Not that I was really trying."
    end


    # raise
  end
end
