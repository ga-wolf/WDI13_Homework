require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'

require 'pry'

get "/" do
  erb :home
end

get "/guitarcars" do
  @guitarcars = query_db "SELECT * FROM guitarcars"
  erb :guitarcars_index
end

post "/guitarcars" do
  query = "INSERT INTO guitarcars (name, type, wheels, colors, image) VALUES ('#{params[:name]}','#{params[:type]}','#{params[:wheels]}','#{params[:colors]}','#{params[:image]}')"
  query_db query
  redirect '/guitarcars'
end

get "/guitarcars/:id" do
  @guitarcar = query_db "SELECT * FROM guitarcars WHERE id = #{params[:id]}"
  erb :guitarcars_show
end

get "/guitarcars_new" do
  erb :guitarcars_new
end

get "/guitarcars/:id/delete" do
  query_db "DELETE FROM guitarcars WHERE id = #{params[:id]}"
  redirect "/guitarcars"
end

get "/guitarcars/:id/edit" do
  @guitarcar = query_db "SELECT * FROM guitarcars WHERE id = #{params[:id]}"
  erb :guitarcars_edit
end

post "/guitarcars/:id" do
  query = "UPDATE guitarcars SET name='#{params['name']}', type='#{params['type']}', wheels='#{params['wheels']}', colors='#{params['colors']}', image='#{params['image']}' WHERE id=#{params['id']}"

  query_db query
  redirect "/guitarcars/#{params[:id]}"
end

def query_db(sql)
  db = SQLite3::Database.new 'database.db'
  db.results_as_hash = true
  result = db.execute sql
  db.close
  result
end
