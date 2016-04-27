class SecretController < ApplicationController

def start
end

def lucky
end

def result
    @user_guess = params[:user_guess].to_i
    @comp_guess = rand(1..10)
    if @user_guess == @comp_guess
        @result = "You Win!"
    elsif @user_guess != @comp_guess
        @result = "You Lose....r"
    end
end

def count
    @comp_guess = rand(1..10)
    @count = 0
end

def counter
    current = params[:num].to_i
    @comp_guess = params[:comp].to_i
    @counter = current + 1
    @user_guess = params[:user_guess].to_i
    if @user_guess == @comp_guess
        redirect_to "/secret/multi/#{@counter}"
    else
        render :counter
    end
end

def multi
    @count = params[:num].to_i
end


end
