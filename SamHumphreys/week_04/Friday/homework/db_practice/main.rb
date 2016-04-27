require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'
require 'active_record'

require 'pry'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'database.db'
)

class Activity < ActiveRecord::Base
end

get "/" do
  erb :home
end

get "/activities" do
  @activities = Activity.all
  erb :activities_index
end

get "/activities/new" do
  erb :activities_new
end

post "/activities" do
  activity = Activity.new
  activity.name = params[:name]
  activity.people = params[:people]
  activity.equipment = params[:equipment]
  activity.risk = params[:risk]
  activity.image = params[:image]
  activity.save
  redirect "/activities"
end

get "/activities/:id" do
  @activity = Activity.find params[:id]
  erb :activities_show
end

get "/activities/:id/edit" do
  @activity = Activity.find params[:id]
  erb :activities_edit
end

post "/activities/:id" do
  activity = Activity.find params[:id]
  activity.name = params[:name]
  activity.people = params[:people]
  activity.equipment = params[:equipment]
  activity.risk = params[:risk]
  activity.image = params[:image]
  activity.save
  redirect "/activities/#{params[:id]}"
end

get "/activities/:id/delete" do
  activity = Activity.find params[:id]
  activity.destroy
  redirect "/activities"
end
