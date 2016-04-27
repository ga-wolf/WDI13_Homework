class RpsController < ApplicationController

def start
end

def play
    @num_games = params[:num].to_i
    @game_count = params[:count].to_i
    @result = "First Game"
    @win_count = params[:win].to_i
    @tie_count = params[:tie].to_i
    @options = ["scissors", "rock", "paper"]
    @comp_num = rand(0..2)
    @comp_pick = @options[@comp_num]
    @user_pick = params[:user_move]
    if @game_count == @num_games
        redirect_to "/rps/result/#{@num_games}/#{@win_count}/#{@tie_count}"
    elsif @game_count > 0
        test(@user_pick, @comp_pick)
        render :play
    else
        render :play
    end
end

def result
    @num_games = params[:num].to_i
    @win_count = params[:win].to_i
    @tie_count = params[:tie].to_i
    @loss_count = @num_games - @win_count - @tie_count
    if @win_count > @loss_count
        @result = "Win"
    elsif @win_count == @loss_count
        @result = "Tie"
    else
        @result = "Lose"
    end
end



end

def test (user, comp)
    if      user == comp
            @result = "You picked #{user}, Computer picked #{comp}, Its a tie"
            @tie_count += 1
    elsif   user == "scissors" && comp == "paper"
            @result = "You picked #{user}, Computer picked #{comp}, You Win!"
            @win_count += 1
    elsif   user == "rock" && comp == "scissors"
            @result = "You picked #{user}, Computer picked #{comp}, You Win!"
            @win_count += 1
    elsif   user == "paper" && comp == "rock"
            @result = "You picked #{user}, Computer picked #{comp}, You Win!"
            @win_count += 1
    else
            @result = "You picked #{user}, Computer picked #{comp}, You Lose."
    end
end
