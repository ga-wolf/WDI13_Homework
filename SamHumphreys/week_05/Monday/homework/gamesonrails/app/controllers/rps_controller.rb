class RpsController < ApplicationController

  def play
  end

  def answer
    @player_move = ''
    @computer_move = ''
    @result = ''

    def get_player_move
      if params[:paper] != nil
        return "paper"
      elsif params[:rock] != nil
        return "rock"
      elsif params[:scissors] != nil
        return "scissors"
      end
    end

    def comp_move(num)
      case num
      when 1 then return "rock"
      when 2 then return "paper"
      when 3 then return "scissors"
      end
    end

    @player_move = get_player_move
    @computer_move = comp_move(rand(1..3))

    def find_winner(pl, cp)
      case pl
      when "rock"
        if cp == "rock"
          return "tie"
        elsif cp == "paper"
          return "computer"
        elsif cp == "scissors"
          return "player"
        end
      when "paper"
        if cp == "rock"
          return "player"
        elsif cp == "paper"
          return "tie"
        elsif cp == "scissors"
          return "computer"
        end
      when "scissors"
        if cp == "rock"
          return "computer"
        elsif cp == "paper"
          return "player"
        elsif cp == "scissors"
          return "tie"
        end
      end
    end

    @result = find_winner(@player_move, @computer_move)
    # p "Computer move was #{ @computer_move }"
    # p "Player move was #{ @player_move }"
    # p "Result is #{ @result }"

  end

end
