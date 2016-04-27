require "sinatra"
require "sinatra/reloader"
require "sqlite3"
require "active_record"

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'database.db'
)

ActiveRecord::Base.logger = Logger.new(STDERR)

class Bee < ActiveRecord::Base
end

class Flower < ActiveRecord::Base
end

get "/" do
  erb :home
end

get "/bees" do
  @bees = Bee.all
  erb :bees_index
end

post "/bees" do
  bee = Bee.new
  bee.name = params[:name]
  bee.honey = params[:honey]
  bee.image = params[:image]
  bee.save
  redirect "/bees"
end

get "/bees/new" do
  erb :bees_new
end

get "/bees/:id" do
  @bee = Bee.find params[:id]
  erb :bees_show
end

get "/bees/:id/delete" do
  bee = Bee.find params[:id]
  bee.destroy
  redirect "/bees"
end

get "/bees/:id/edit" do
  @bee = Bee.find params[:id]
  erb :bees_edit
end

post "/bees/:id" do
  bee = Bee.new
  bee.name = params[:name]
  bee.honey = params[:honey]
  bee.image = params[:image]
  bee.save
  redirect "/bees/#{ params[:id] }"
end

get "/flowers" do
  @flowers = Flower.all
  erb :flowers_index
end

get "/flowers/new" do
  erb :flowers_new
end

post "/flowers" do
  flower = Flower.new
  flower.name = params[:name]
  flower.image = params[:image]
  flower.save
  redirect "/flowers"
end

get "/flowers/:id" do
  @flower = Flower.find params[:id]
  erb :flowers_show
end

get "/flowers/:id/delete" do
  flower = Flower.find params[:id]
  flower.destroy
  redirect "/flowers"
end

get "/flowers/:id/edit" do
  @flower = Flower.find params[:id]
  erb :flowers_edit
end

post "/flowers/:id" do
  flower = Flower.find params[:id]
  flower.name = params[:name]
  flower.image = params[:image]
  flower.save
  redirect "/flowers"
end
