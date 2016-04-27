class MountainsController < ApplicationController

  def index
    @mountains = Mountain.all
  end

  def show
    @mountains = Mountain.find params[:id]
  end

  def new
  end

  def create
    mountain = mountains_params
    redirect_to mountain_path(mountain.id)
  end

  def delete
    @mountain = Mountain.find params[:id]
    @mountain.destroy
    redirect_to root_path
  end

  def edit
    @mountain = Mountain.find params[:id]
  end

  def update
    mountain = Mountain.find params[:id]
    mountain.update mountains_params
    redirect_to mountain_path(mountain.id)
  end

private
def mountains_params
    params.permit :name, :image, :height, :elevation, :country, :country_other
end

end
