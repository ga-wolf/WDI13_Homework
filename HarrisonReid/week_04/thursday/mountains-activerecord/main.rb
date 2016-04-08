require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'
require 'active_record'
require 'rainbow'
require 'pry'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'database.db'
)

ActiveRecord::Base.logger = Logger.new(STDERR)

class Mountain < ActiveRecord::Base
end

get '/' do
  redirect '/mountains'
end

get '/mountains' do
  @mountains = Mountain.all
  erb :mountains_index
end

# NEW
get '/mountains/new' do
  erb :mountains_new
end

# CREATE
post '/mountains' do
  mountain = Mountain.new
  mountain.name = params[:name]
  mountain.height = params[:height]
  mountain.year_climbed = params[:year_climbed]
  mountain.country = params[:country]
  mountain.image = params[:image_url]
  mountain.save
  redirect '/mountains'
end

#SHOW
get '/mountains/:id' do
  @mountain = Mountain.find(params[:id])
  erb :mountains_show
end

# EDIT
get '/mountains/:id/edit' do
  @mountain = Mountain.find(params[:id])
  erb :mountains_edit
end

# UPDATE
post '/mountains/:id' do
  mountain = Mountain.find(params[:id])
  mountain.name = params[:name]
  mountain.height = params[:height]
  mountain.year_climbed = params[:year_climbed]
  mountain.country = params[:country]
  mountain.image = params[:image_url]
  mountain.save
  redirect "/mountains/#{params[:id]}"
end

# DESTROY
get '/mountains/:id/delete' do
  mountain = Mountain.find(params[:id])
  mountain.destroy
  redirect '/mountains'
end
