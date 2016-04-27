require 'sinatra'
require 'sinatra/reloader'
require'pry'
require 'sqlite3'

def query_db(sql)
    db = SQLite3::Database.new 'database.db'
    db.results_as_hash= true
    puts sql
    result = db.execute sql
    db.close
    result
end

get "/" do
    @logos = query_db "SELECT * FROM batman_logos"
  erb :home
end

get "/logos" do
  @logos = query_db "SELECT * FROM batman_logos"
  erb :home
end

post "/logos" do
  query = "INSERT INTO batman_logos (origin,year,more_info,image) VALUES ('#{params[:origin]}','#{params[:year]}','#{params[:more_info]}','#{params[:image]}')"
  query_db query
  redirect '/logos'
end

get "/logo/new" do
  erb :logo_new
end

get "/logos/:id/edit" do
  @logo = query_db "SELECT * FROM batman_logos WHERE id='#{params[:id]}'"
  erb :logos_edit
end


get "/logo/:id" do
  @logo = query_db "SELECT * FROM batman_logos WHERE id='#{params[:id]}'"
  erb :logo_show
end

get "/logos/:id/delete" do
    query_db "DELETE FROM batman_logos WHERE id = #{params[:id]}"
    redirect '/logos'
end

post '/logos/:id' do
  query = "UPDATE batman_logos SET origin='#{params[:origin]}', year='#{params[:year]}', image='#{params[:image]}', more_info='#{params[:more_info]}' WHERE id=#{params[:id]}"
  query_db query
  redirect "/logo/#{params[:id]}"
end
