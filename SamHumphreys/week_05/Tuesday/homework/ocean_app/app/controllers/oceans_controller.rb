class OceansController < ApplicationController

  def index
    @oceans = Ocean.all
  end

  def show
    @ocean = Ocean.find params[:id]
  end

  def new
  end

  def create
    ocean = Ocean.create ocean_params
    redirect_to "/oceans/#{ocean.id}"
  end

  def edit
    @ocean = Ocean.find params[:id]
  end

  def update
    ocean = Ocean.find params[:id]
    ocean.update ocean_params
    redirect_to "/oceans/#{ocean.id}"
  end

  def delete
    ocean = Ocean.find params[:id]
    ocean.destroy
    redirect_to '/oceans'
  end

  private
  def ocean_params
    params.permit :name, :seas, :continents, :depth, :salinity, :image
  end
end
