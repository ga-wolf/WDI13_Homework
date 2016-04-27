class NumberguessController < ApplicationController

  def playguess
  end

  def answer_guess
    @player_guess = params[:input].to_i
    @comp_guess = rand(1..10)
  end
end
