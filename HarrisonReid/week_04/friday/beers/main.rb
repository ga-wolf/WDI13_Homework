require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'sqlite3'
require 'pry'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'database.db'
)

ActiveRecord::Base.logger = Logger.new(STDERR)

class Beer < ActiveRecord::Base
end

get '/' do
  redirect '/beers'
end

get '/beers' do
  @beers = Beer.all
  erb :beers_index
end

get '/beers/new' do
  erb :beers_new
end

post '/beers' do
  beer = Beer.new
  beer.manufacturer = params[:manufacturer]
  beer.name = params[:name]
  beer.style = params[:style]
  beer.alcohol_content = params[:alcohol_content]
  beer.image_url = params[:image_url]
  beer.save

  redirect '/beers'
end

get '/beers/:id' do
  @beer = Beer.find(params[:id])
  erb :beers_show
end

get '/beers/:id/edit' do
  @beer = Beer.find(params[:id])
  erb :beers_edit
end

post '/beers/:id' do
  beer = Beer.find(params[:id])
  beer.manufacturer = params[:manufacturer]
  beer.name = params[:name]
  beer.style = params[:style]
  beer.alcohol_content = params[:alcohol_content]
  beer.image_url = params[:image_url]
  beer.save
  redirect "/beers/#{params[:id]}"
end

get '/beers/:id/delete' do
  beer = Beer.find(params[:id])
  beer.destroy

  redirect "/beers"
end
