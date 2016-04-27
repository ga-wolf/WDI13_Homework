class MountainsController < ApplicationController
  def index
    @mountains = Mountain.all
  end

  def show
    @mountain = Mountain.find params[:id]
  end

  def new

  end

  def create
    mountain = Mountain.create mountain_params
    redirect_to "/mountains/#{mountain.id}"
  end

  def destroy
    mountain = Mountain.find params[:id]
    mountain.destroy
    redirect_to "/mountains"
  end

  def edit
    @mountain = Mountain.find params[:id]

  end
  def update
    mountain = Mountain.find params[:id]
    mountain.update mountain_params
    redirect_to "/mountains/#{params[:id]}"
  end

private
  def mountain_params
    params.permit :name, :image, :location, :ascent, :height
  end
end
