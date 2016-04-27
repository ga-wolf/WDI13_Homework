class MountainsController < ApplicationController

def index
@mountains = Mountain.all
end

def new
end


private
def mountains_params
  params.permit :name, :image, :country, :type, :height
end

end
