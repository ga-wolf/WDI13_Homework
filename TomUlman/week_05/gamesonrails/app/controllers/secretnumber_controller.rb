class SecretnumberController < ApplicationController

  def guess
  end

  def result
    @value = params[:num].to_i
    @secretnumber = rand(1..10)

    if @value == @secretnumber
      @return = "You have Won"
    else
      @return = "you have lost"
  end
end
end
