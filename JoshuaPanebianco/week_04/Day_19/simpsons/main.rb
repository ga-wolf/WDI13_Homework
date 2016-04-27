require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'
require 'pry'

get '/' do
  erb :home
end

get '/new' do
  erb :new
end

get '/new' do
 "The simpsons"
 erb :new
end

get '/simpsons/:id' do
  @simpson = query_db "SELECT * FROM simpsons WHERE id = #{params[:id]}"
  erb :show
end

get '/index' do
  @simpsons = query_db "SELECT * FROM simpsons"
  erb :index
end

post '/simpsons' do
 query = "INSERT INTO simpsons (name, image) VALUES ('#{params[:name]}','#{params[:image]}')"
 query_db query
 redirect "/index"
end

def query_db(sql)
  db = SQLite3::Database.new 'database.db'
  db.results_as_hash = true

  result = db.execute(sql)
  db.close
  return result
end
