class ResultsController < ApplicationController
  def results
    @random_num = rand(1..10)
    @user_guess = params[:number]
    if @random_num == @user_guess
      @result = "Congratulations, you won"
    else
      @result = "Wrong guess, try again"
    end
  end
end
