class GuessingController < ApplicationController

  def answer

    @num = params[:num].to_i
    @compnum = Random.rand(1..10)

    if @num == @compnum
      @winner = "You win!"
    else
      @winner = "You lose!"
  end
end

end
