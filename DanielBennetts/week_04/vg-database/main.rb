require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'
require 'active_record'


ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'database.db'
)

ActiveRecord::Base.logger = Logger.new(STDERR)

class Game < ActiveRecord::Base
end


get "/" do
  erb :home
end

# INDEX
get "/games" do
  @games = Game.all
  erb :games_index
end

get '/games/new' do
  erb :games_new
end

post '/games' do
  game = Game.new
  game.title = params[:title]
  game.genre = params[:genre]
  game.console = params[:console]
  game.image = params[:image]
  game.save
  redirect '/games'
end

# SHOW
get '/games/:id' do
  @game = Game.find params[:id]
  erb :games_show
end

get '/games/:id/delete' do
  game = Game.find params[:id]
  game.destroy
  redirect "/games"
end

get '/games/:id/edit' do
  @game = Game.find params[:id]
  erb :games_edit
end

post '/games/:id' do
  game = Game.find params[:id]
  game.title = params[:title]
  game.genre = params[:genre]
  game.console = params[:console]
  game.image = params[:image]
  game.save
  redirect "/games/#{params[:id]}"
end
