require "pry"
require "sinatra"
require "sinatra/reloader"
require "sqlite3"

get "/" do
  erb :home
end

### INDEX
get "/dogs" do
  @dogs = query_db("SELECT * FROM dogs")
  erb :dogs_index
end

### ADD
get "/dogs/new" do
  erb :dogs_new
end

post "/dogs" do
  query = "INSERT INTO dogs (breed, family, life_span, image, more_info) VALUES ('#{params[:breed]}' ,'#{params[:family]}','#{params[:life_span]}','#{params[:image]}','#{params[:more_info]}' )"
  query_db(query)
  redirect "/dogs"
end

### SHOW
get "/dogs/:id" do
  @dog = query_db("SELECT * FROM dogs WHERE id=#{params[:id]}")
  erb :dogs_show
end

### DELETE
get "/dogs/:id/delete" do
  query_db("DELETE FROM dogs WHERE id = #{params[:id]}")
  redirect "/dogs"
end

### EDIT
get "/dogs/:id/edit" do
  @dog = query_db("SELECT * FROM dogs WHERE id=#{params[:id]}")
  erb :dogs_edit
end

### UPDATE
post "/dogs/:id" do
  query = "UPDATE dogs SET breed='#{params[:breed]}',family='#{params[:family]}',life_span='#{params[:life_span]}',image='#{params[:image]}',more_info='#{params[:more_info]}' WHERE id=#{params[:id]}"
  query_db(query)
  redirect "/dogs/#{params[:id]}"
end

### DB LOOKUP
def query_db(sql)
  db = SQLite3::Database.new 'database.db'
  db.results_as_hash = true

  result = db.execute sql
  db.close
  result
end
