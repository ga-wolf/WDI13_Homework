require "sinatra"
require "sinatra/reloader"
require "sqlite3"
require "active_record"

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'database.db'
)

ActiveRecord::Base.logger = Logger.new(STDERR)

class Musician < ActiveRecord::Base
  has_many :albums, dependent: :destroy
end

class Album < ActiveRecord::Base
  belongs_to :musician
end

get '/' do
  erb :home
end

## MUSICIANS

get '/musicians' do
  @musicians = Musician.all
  erb :musicians_index
end

get '/musicians/new' do
  erb :musicians_new

end

post '/musicians' do
  musician = Musician.new
  musician.name = params[:name]
  musician.genre = params[:genre]
  musician.image = params[:image]
  musician.video = params[:video]
  musician.save
  redirect '/musicians'
end

get '/musicians/:id' do
  @musician = Musician.find params[:id]
  erb :musicians_show
end

get '/musicians/:id/delete' do
  musician = Musician.find params[:id]
  musician.destroy
  redirect '/musicians'
end

get '/musicians/:id/edit' do
  @musician = Musician.find params[:id]
  erb :musicians_edit
end

post '/musicians/:id' do
  musician = Musician.find params[:id]
  musician.name = params[:name]
  musician.genre = params[:genre]
  musician.image = params[:image]
  musician.video = params[:video]
  musician.save
  redirect "/musicians/#{params[:id]}"
end

## ALBUMS

get '/albums' do
  @albums = Album.all
  erb :albums_index
end

get '/albums/new' do
  erb :alumbs_new
end

post '/albums' do

end
