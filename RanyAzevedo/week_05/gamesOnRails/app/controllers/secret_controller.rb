class SecretController < ApplicationController
  def play
  end

  def result
    @number = params[:secret_number].to_i
    @computerPlay = rand(1..10).to_i
    redirect_to '/secret' if (@number > 10) || (@number <= 0)
    if @number > @computerPlay
      @message = "Congrats. You are the winner!!"
    end
    if @computerPlay > @number
    @message = "You lost, Computer is the winner!"
    end
    if @computerPlay == @number
    @message = "You got the same number!"
    end

  end

end
