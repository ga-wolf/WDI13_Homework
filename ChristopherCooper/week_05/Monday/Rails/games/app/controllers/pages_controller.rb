class PagesController < ApplicationController
  def home
  end

  def magic
  end

  def magicanswer
    answers = ["It is certain", "It is decidedly so", "Without a doubt", "Yes, definitely", "You may rely on it", "As I see it, yes",
      "Most likely", "Outlook good", "Yes", "Signs point to yes", "Reply hazy try again", "Ask again later", "Better not tell you now", "Cannot predict now", "Concentrate and ask again", "Don't count on it", "My reply is no", "My sources say no", "Outlook not so good", "Very doubtful"]

    @result = answers.sample

  end

  def secret
  end

  def answer
    @value = params[:num].to_i
    @genNum = rand(1..10)

    if @value == @genNum
      @winner = 'You Win'
    else
      @winner = 'You Lose'
    end

  end


  def winner
    @value = params[:move]
    @genNum = rand()

    if @genNum < 0.33
      @winner = 'Scissors'
    elsif @genNum < 0.66
      @winner = 'Rock'
    else
      @winner = 'Paper'
    end

    if @winner == @value
      @game = 'Draw'
    elsif @winner == 'Scissors' && @value == 'Paper'
      @game = 'Computer Wins'
    elsif @winner == 'Paper' && @value == 'Rock'
      @game = 'Computer Wins'
    elsif @winner == 'Rock' && @value == 'Scissors'
      @game = 'Computer Wins'
    else
      @game = 'You win'
    end

  end


end
