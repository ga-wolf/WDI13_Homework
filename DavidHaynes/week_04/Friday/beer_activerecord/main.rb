require "sinatra"
require "sinatra/reloader"
require "sqlite3"
require "active_record"

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'database.db'
)

ActiveRecord::Base.logger = Logger.new(STDERR)

class Beer < ActiveRecord::Base
end

get '/' do
    erb :home
end


#index
get '/beers' do
    @beer = Beer.all
    erb :beer_index
end

post '/beers' do
    beer = Beer.new
    beer.name= params[:name]
    beer.country= params[:country]
    beer.category= params[:category]
    beer.image= params[:image]
    beer.save
    redirect '/beers'
end

get '/beers/new' do

    erb :beer_new
end

get '/beers/:id' do
    @this_beer = Beer.find params[:id]
    erb :beer_show
end

get '/beers/:id/delete' do
    beer = Beer.find params[:id]
    beer.destroy
    redirect '/beers'
end

get '/beers/:id/edit' do
    @this_beer = Beer.find params[:id]
    erb :beer_edit
end

post '/beers/:id/edit' do
  beer = Beer.find params[:id]
  beer.name= params[:name]
  beer.country= params[:country]
  beer.category= params[:category]
  beer.image= params[:image]
  beer.save
  redirect '/beers'
end
