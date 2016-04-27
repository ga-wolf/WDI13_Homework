class SummitsController < ApplicationController

  def index
    @summits = Summit.all
  end

  def new
  end

  def show
    @summit = Summit.find params[:id]
  end

  def edit
  end

  def home
  end

  def update
    summit = Summit.find params[:id]
    summit.update summit_params
    redirect_to summit_path(summit.id)
  end

  def create
    summit = Summit.create summit_params
    redirect_to summit_path(summit.id)
  end 

  private
  def summit_params
    params.permit :name, :height, :image, :country
  end



end
