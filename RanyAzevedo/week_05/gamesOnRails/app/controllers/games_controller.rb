class GamesController < ApplicationController
  def home
  end

  def rock_paper_scissors_play
  end

  def result
    @player = params[:throw]
    @plays = ['rock', 'paper', 'scissors']
    @computer =  @plays.sample
    redirect_to '/games/rock_paper_scissors' if ((@player != 'rock') && (@player != 'paper') && (@player != 'scissors'))
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
