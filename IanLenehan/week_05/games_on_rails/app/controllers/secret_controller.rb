class SecretController < ApplicationController

  def form
  end

  def result
    @guess = params[:n].to_i
    @number = rand(1..10)
  end

end
