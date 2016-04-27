require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'

get '/' do
erb :home
end

#index
get '/fingerlimes' do
  @fingerlimes = query_db "SELECT * FROM fingerlimes"
  erb :fingerlimes_index
end

#CREATING NEW
get '/fingerlimes/new' do
  erb :fingerlimes_new
end

post '/fingerlimes' do
  query = "INSERT INTO fingerlimes (name, sweetness, bite, pop, image) VALUES ('#{params[:name]}', '#{params[:sweetness]}', '#{params[:bite]}', '#{params[:pop]}', '#{params[:image]}')"
  query_db query
  redirect '/fingerlimes'
end


#INDIVIDUALS
get '/fingerlimes/:id' do
  @fingerlime = query_db "SELECT * FROM fingerlimes WHERE id=#{ params[:id]}"
  erb :fingerlimes_show
end

get '/fingerlimes/:id/delete' do
  query_db "DELETE FROM fingerlimes WHERE id = #{ params[:id] }"
  redirect '/fingerlimes'
end

get '/finderlimes/:id/edit' do

@fingerlime = query_db "SELECT * FROM fingerlimes WHERE id#{ params[:id] }"
erb :fingerlimes_edit
end

 post 'finderlimes/:id' do
 query = "UPDATE fingerlimes SET name='#{params[:name]}', sweetness='#{params[:sweetness]}', bite='#{params[:bite]}', pop='#{params[:pop]}', image='#{params[:image]}' WHERE id =#{params[:id]}"
 query_db
 redirect "/fingerlimes/#{params[:id]}"
 end

def query_db(sql)
  db = SQLite3::Database.new 'database.db'
  db.results_as_hash = true

  puts sql

  result = db.execute sql
  db.close
  result
end
