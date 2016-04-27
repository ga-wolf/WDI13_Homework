require 'sinatra'
require 'sinatra/reloader'
require'pry'
require 'sqlite3'
require 'active_record'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'database.db'
)

ActiveRecord::Base.logger = Logger.new(STDERR)

class BatmanLogo < ActiveRecord::Base
end

get "/" do
    @logos = BatmanLogo.all
    erb :home
end

get "/logos" do
  @logos = BatmanLogo.all
  erb :home
end

post "/logos" do
  logos = BatmanLogo.new
  logos.origin = params[:origin]
  logos.year = params[:year]
  logos.more_info = params[:more_info]
  logos.image = params[:image]
  logos.save
  redirect '/logos'
end

post '/logos/:id' do
  logos = BatmanLogo.new
  logos.origin = params[:origin]
  logos.year = params[:year]
  logos.more_info = params[:more_info]
  logos.image = params[:image]
  logos.save
  redirect "/logos/#{ params[:id] }"
end

get "/logo/new" do
  erb :logo_new
end

get "/logos/:id/edit" do
    @logo = BatmanLogo.find params[:id]
    erb :logos_edit
end


get "/logo/:id" do
  @logo = BatmanLogo.find params[:id]
  erb :logo_show
end

get "/logos/:id/delete" do
    logo = Plant.find params[:id]
    logo.destroy
    redirect '/logos'
end
