require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'
require 'active_record'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'database.db'
)

ActiveRecord::Base.logger = Logger.new(STDERR)

class Cake < ActiveRecord::Base
end

get '/' do
  erb :home
end

# INDEX
get '/cakes' do
  @cakes = Cake.all
  erb :cakes_index, :layout => :layout_alt
end

get '/cakes/new' do
  erb :cakes_new, :layout => :layout_alt
end

post '/cakes' do
  # Cake.create :name => params[:name], :family => params[:family], :image => params[:image]
  cake = Cake.new
  cake.name = params[:name]
  cake.family = params[:occasion]
  cake.image = params[:image]
  cake.recipe = params[:recipe]
  cake.save
  redirect '/cakes'
end

get '/cakes/:id' do
  @cake = Cake.find params[:id]
  erb :cakes_show, :layout => :layout_alt
end

get '/cakes/:id/delete' do
  cake = Cake.find params[:id]
  cake.destroy
  redirect '/cakes'
end

get '/cakes/:id/edit' do
  @cake = Cake.find params[:id]
  erb :cakes_edit, :layout => :layout_alt
end

post '/cakes/:id' do
  cake = Cake.find params[:id]
  cake.name = params[:name]
  cake.occasion = params[:occasion]
  cake.image = params[:image]
  cake.recipe = params[:recipe]
  cake.save
  redirect "/cakes/#{ params[:id] }"
end

# get '/' do
#   erb :home
# end
#
# # INDEX
# get '/cakes' do
#   @cakes = query_db 'SELECT * FROM cakes'
#   erb :cakes_index, :layout => :layout_alt
# end
#
# get '/cakes/new' do
#   erb :cakes_new, :layout => :layout_alt
# end
#
# post '/cakes' do
#   query = "INSERT INTO cakes (name, occasion, image) VALUES ('#{params[:name]}', '#{params[:occasion]}', '#{params[:image]}')"
#   query_db query
#   redirect '/cakes'
# end
#
# get '/cakes/:id' do
#   @cake = query_db "SELECT * FROM cakes WHERE id = #{ params[:id] }"
#   erb :cakes_show, :layout => :layout_alt
# end
#
# get '/cakes/:id/delete' do
#   query_db "DELETE FROM cakes WHERE id = #{ params[:id] }"
#   redirect '/cakes'
# end
#
# get '/cakes/:id/edit' do
#   @cake = query_db "SELECT * FROM cakes WHERE id = #{ params[:id] }"
#   erb :cakes_edit, :layout => :layout_alt
# end
#
# post '/cakes/:id' do
#   query = "UPDATE cakes SET name='#{params[:name]}', occasion='#{params[:occasion]}', image='#{params[:image]}' WHERE id=#{params[:id]}"
#   query_db query
#   redirect "/cakes/#{ params[:id] }"
# end
#
# def query_db(sql)
#   db = SQLite3::Database.new 'database.db'
#   db.results_as_hash = true
#
#   puts sql
#
#   result = db.execute sql
#   db.close
#   result
# end
