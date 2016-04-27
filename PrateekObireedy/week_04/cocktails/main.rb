require "pry"
require "sinatra"
require "sinatra/reloader"
require "sqlite3"

get "/cocktails_new" do

  "Cocktails coming soon..."

  erb :cocktails_new
end

post "/cocktails" do

  query = "INSERT INTO cocktails (name, spirits, image) VALUES ('#{params[:name]}',
'#{params[:spirits]}', '#{params[:image]}' )"

query_db query

redirect "/cocktails"
end

get "/home" do

erb :home

end
get "/" do
erb :home
end

get "/cocktails" do

  db = SQLite3::Database.new "database.db"
  db.results_as_hash = true

  @cocktails = query_db "SELECT * FROM cocktails"
  erb :cocktails_index

end

get "/cocktails/:id" do

  db = SQLite3::Database.new "database.db"
  db.results_as_hash = true

  @cocktail = query_db "SELECT * FROM cocktails WHERE id = #{params[:id]}"
  erb :cocktails_show

end

get "/cocktails/:id/delete" do

  query_db "DELETE FROM cocktails WHERE id = #{params[:id]}"
  redirect "/cocktails"

end

get "/cocktails/:id/edit" do

  @cocktail = query_db "SELECT * FROM cocktails where id = #{params[:id]}"
  erb :cocktails_edit

end

post "/cocktails/:id" do

  query = "UPDATE cocktails SET name = '#{params[:name]}', spirits = '#{params[:spirits]}',
  image = '#{params[:image]}'WHERE id = '#{params[:id]}'"
  query_db query
  redirect "/cocktails/#{params[:id]}"

end

def query_db(sql)

  db = SQLite3::Database.new "database.db"
  db.results_as_hash = true

  puts "sql"

  result = db.execute sql
  db.close
  result

end
