require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'
require 'active_record'

ActiveRecord::Base.establish_connection(
:adapter => "sqlite3",
:database => "database.db"
)

#logs all of the sql
ActiveRecord::Base.logger = Logger.new(STDERR)

class Wine < ActiveRecord::Base
end

class Region < ActiveRecord::Base
end

get '/' do
  erb :home
end

get '/wines' do
  @wines = Wine.all
  erb :wines_index
end

get '/wines/new' do
  erb :wines_new
end

post '/wines' do
  wine = Wine.new
  wine.name = params[:name]
  wine.style = params[:style]
  wine.palate = params[:palate]
  wine.image = params[:image]
  wine.save
  redirect '/wines'
end

get '/wines/:id' do
@wine = Wine.find params[:id]
erb :wines_show
end

get '/wines/:id/delete' do
@wine = Wine.find params[:id]
@wine.destroy
redirect '/wines'
end

get '/wines/:id/edit' do
  @wine = Wine.find params[:id]
  erb :wines_edit
end

post '/wines/:id' do
wine = Wine.find params[:id]
wine.name = params[:name]
wine.style = params[:style]
wine.palate = params[:palate]
wine.image = params[:image]
wine.save
redirect "/wines.#{params[:id]}"
end
