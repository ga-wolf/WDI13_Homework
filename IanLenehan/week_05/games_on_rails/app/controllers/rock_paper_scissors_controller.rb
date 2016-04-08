class RockPaperScissorsController < ApplicationController

  def game
  end

  def result
    @throw = params[:throw]
    options = {
      1 => "rock",
      2 => "paper",
      3 => "scissors"
    }
    @computer_throw = options[rand(1..3)]
    @winner = ''
    @message = ''

    if @throw == @computer_throw
      @winner = 'tie'
    elsif @throw == "rock" && @computer_throw == "scissors"
      @winner = 'player'
    elsif @throw == "scissors" && @computer_throw == "paper"
      @winner = 'player'
    elsif @throw == "paper" && @computer_throw == "rock"
      @winner = 'player'
    else @winner = 'computer'
    end

    if @winner == 'player'
      @message = "Congratulations, you win!"
    elsif @winner == 'computer'
      @message = 'Too bad, the computer won this round.'
    else
      @message = 'The result was a draw!'
    end

  end

end
