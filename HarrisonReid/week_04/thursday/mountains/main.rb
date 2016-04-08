require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'
require 'rainbow'
require 'pry'

get '/' do
  redirect '/mountains'
end

get '/mountains' do
  @mountains = query_db "SELECT * FROM mountains"
  erb :mountains_index
end

# NEW
get '/mountains/new' do
  erb :mountains_new
end

# CREATE
post '/mountains' do
  query = "INSERT INTO mountains (name, height, country, year_climbed, image) VALUES ('#{params[:name]}', '#{params[:height]}', '#{params[:country]}', '#{params[:year_climbed]}', '#{params[:image_url]}')"
  query_db query
  redirect '/mountains'
end

#SHOW
get '/mountains/:id' do
  @mountain = query_db "SELECT * FROM mountains WHERE id=#{params[:id]}"
  erb :mountains_show
end

# EDIT
get '/mountains/:id/edit' do
  @mountain = query_db "SELECT * FROM mountains WHERE id=#{params[:id]}"
  erb :mountains_edit
end

# UPDATE
post '/mountains/:id' do
  query = "UPDATE mountains SET name='#{params[:name]}', height='#{params[:height]}', country='#{params[:country]}', year_climbed='#{params[:year_climbed]}', image='#{params[:image_url]}' WHERE id='#{params[:id]}'"
  query_db query
  redirect "/mountains/#{params[:id]}"
end

# DESTROY
get '/mountains/:id/delete' do
  query_db "DELETE FROM mountains WHERE id=#{params[:id]}"
  redirect '/mountains'
end

def query_db (sql)
  db = SQLite3::Database.new 'database.db'
  db.results_as_hash = true
  puts Rainbow(sql).green
  result = db.execute sql
  db.close
  result
end
