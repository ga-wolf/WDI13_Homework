require "sinatra"
require "sinatra/reloader"
require "sqlite3"

get "/" do
  erb :home
end

get "/bees" do
  @bees = query_db "SELECT * FROM bees"
  erb :bees_index
end

post "/bees" do
  query = "INSERT INTO bees (name, honey, image) VALUES ('#{params[:name]}','#{params[:honey]}', '#{params[:image]}')"
  query_db query
  redirect "/bees"
end

get "/bees/new" do
  erb :bees_new
end

get "/bees/:id" do
  @bee = query_db "SELECT * FROM bees WHERE id=#{ params[:id] }"
  erb :bees_show
end

get "/bees/:id/delete" do
  query_db "DELETE FROM bees WHERE id = #{ params[:id] }"
  redirect "/bees"
end

get "/bees/:id/edit" do
  @bee = query_db "SELECT * FROM bees WHERE id=#{ params[:id] }"
  erb :bees_edit
end

post "/bees/:id" do
  query = "UPDATE bees SET name='#{params[:name]}', honey='#{params[:honey]}', image='#{params[:image]}' WHERE id=#{params[:id]}"
  query_db query
  redirect "/bees/#{ params[:id] }"
end

def query_db(sql)
  db = SQLite3::Database.new 'database.db'
  db.results_as_hash = true

  puts = sql

  result = db.execute sql
  db.close
  result
end
