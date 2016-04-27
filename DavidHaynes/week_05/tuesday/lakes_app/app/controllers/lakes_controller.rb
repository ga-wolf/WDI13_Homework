class LakesController < ApplicationController

def index
  @lakes = Lake.all
end

def show
  @lake = Lake.find params[:id]
end

def new
end

def create
  lake = Lake.create lake_params
  redirect_to lake_path(lake.id)
end

def delete
  lake = Lake.find params[:id]
  lake.destroy
  redirect_to lakes_path
end

def edit
  @lake = Lake.find params[:id]
end

def update
  lake = Lake.find params[:id]
  lake.update lake_params
  redirect_to lake_path(lake.id)
end



private
  def lake_params
    params.permit :name, :image, :country, :country_other, :volume, :area, :max_depth
  end
end
