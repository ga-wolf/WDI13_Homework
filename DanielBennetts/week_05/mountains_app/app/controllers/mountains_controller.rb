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
    redirect_to mountains_path(mountain.id)
  end

  def destroy
  mountain = Mountain.find params[:id]
  mountain.destroy
  redirect_to mountains_path
end

def edit
  @mountain = Mountain.find params[:id]
end

def update
    mountains = Mountain.find params[:id]
    mountain.update mountain_params
    redirect_to mountains_path(mountain.id)
  end

  private
  def mountain_params
    # White list of safe things we can use
      params.permit :name, :image, :country, :range, :metres
  end



end
