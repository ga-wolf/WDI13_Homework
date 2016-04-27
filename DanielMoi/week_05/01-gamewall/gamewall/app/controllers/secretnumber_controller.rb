class SecretnumberController < ApplicationController
  def home
  end

  def answer
    @guess = params[:guess]

    while @secret == @guess.to_i || @secret == nil
      @secret = Random.rand(1..10)
    end
    # raise
  end
end
