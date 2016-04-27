class RpsgameController < ApplicationController
  def play
  end

  def result
    @player = params[:options]
    @plays = ['rock', 'paper', 'scissors']
    @computer =  @plays.sample
    if @player == @computer
      @message = " It's a TIE "
    end
    if ((@player == 'rock') && (@computer == 'scissors')) || ((@player == 'paper') && (@computer == 'rock')) || ((@player == 'scissors') && (@computer == 'paper'))
      @message = 'Congrats! You won!!'
  elsif ((@computer == 'rock') && (@player == 'scissors')) || ((@computer == 'paper') && (@player == 'rock')) || ((@computer == 'scissors') && (@player == 'paper'))
      @message = 'You lost! Computer won!'
    end
  end
end
