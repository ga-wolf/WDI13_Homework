class RpsController < ApplicationController

  def play
    rps = {
      "rock" => "scissors",
      "paper" => "rock",
      "scissors" => "paper"
    }
    @players_turn = params[:throw]
    @computer_turn = ["rock", "paper", "scissors"].sample

    if @players_turn == @computer_turn
      @win = "It's a tie!"
    elsif rps[@players_turn] == @computer_turn
      @win = "You win!"
    else
      @win = "You lose!"
    end


  
  end


end
