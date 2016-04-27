require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'
require 'active_record'
require 'pry'

ActiveRecord::Base.establish_connection(
   :adapter => 'sqlite3',
   :database => 'database.db'
)

ActiveRecord::Base.logger = Logger.new(STDERR)

class City < ActiveRecord::Base
end

class Attraction < ActiveRecord::Base
end


# - - - - - - - - - - - - - - - - - -Cities - - - - - - - - - - - - - - - - - - #
# HOMEPAGE
get '/' do
  erb :main
end

#INDEX - Show all (1)
get '/cities' do
  @cities = City.all
    erb :cities_index
end

#FORM - how to create one (5)
get '/cities/new' do
  erb :cities_new
end

# SEND FORM - Create one (6)
post '/cities' do
  city = City.new
  city.city = params[:city]
  city.country = params[:country]
  city.image = params[:image]
  city.save
  redirect '/cities'
end

#SHOWPAGE - Show one (2)
get '/cities/:id' do
  @city = City.find params[:id]
    erb :cities_show
end

#DELETE (7)
get '/cities/:id/delete' do
  city = City.find params[:id]
  city.destroy
  redirect '/cities'
end

# EDIT - how to edit one (3)
get '/cities/:id/edit' do
  @city = City.find params[:id]
  erb :cities_edit
end

# EDIT (4)
post '/cities/:id' do
  city = City.find params[:id]
  city.city = params[:city]
  city.country = params[:country]
  city.image = params[:image]
  city.save
  redirect "/cities/#{params[:id]}"
end


# - - - - - - - - - - - - - - - - - -Attraction - - - - - - - - - - - - - - - - - - #

get '/attractions' do
  @attractions = Attraction.all
  erb :attractions_index
end

get '/attractions/new' do
  erb :attraction_new
end

post '/attractions' do
  attraction = Attraction.new
  attraction.place = params[:place]
  attraction.language = params[:language]
  attraction.food = params[:food]
  attraction.image = params[:image]
  attraction.save
  redirect "/attractions"
end

get '/attractions/:id' do
  @attraction = Attraction.find params[:id]
  erb :attractions_show
end

get '/attractions/:id/delete' do
   attraction = Attraction.find params[:id]
   attraction.destroy
   redirect "/attractions"
end

get '/attractions/:id/edit' do
  @attraction = Attraction.find params[:id]
  erb :attractions_edit
end

post '/attractions/:id' do
  attraction = Attraction.find params[:id]
  attraction.place = params[:place]
  attraction.language = params[:language]
  attraction.food = params[:food]
  attraction.image = params[:image]
  attraction.save
  redirect "/attractions/#{params[:id]}"
end
