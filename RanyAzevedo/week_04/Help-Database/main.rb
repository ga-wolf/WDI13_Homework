require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'
require 'active_record'

ActiveRecord::Base.establish_connection(
   :adapter => 'sqlite3',
   :database => 'database.db'
)

ActiveRecord::Base.logger = Logger.new(STDERR)


class Website < ActiveRecord::Base
end

class Categorie < ActiveRecord::Base
end




#_________________________________WEBSITE_____________________________________#

get '/' do
  erb :main
end

get '/websites' do
  @websites = Website.all
  erb :websites_index
end

get '/websites/new' do
  erb :websites_new
end

post '/websites' do
  website = Website.new
  website.name = params[:name]
  website.link = params[:link]
  website.help = params[:help]
  website.save
  redirect '/websites'
end

get "/websites/:id" do
  @website = Website.find params[:id]
    erb :websites_show
  end

get '/websites/:id/delete' do
  website = Website.find params[:id]
  website.destroy
  redirect '/websites'
  end

get '/websites/:id/edit' do
  @website = Website.find params[:id]
  erb :websites_edit
end

post '/websites/:id' do
  website = Website.find params[:id]
  website.name = params[:name]
  website.link = params[:link]
  website.help = params[:help]
  website.save
  redirect "/websites/#{params[:id]}"
end

#_________________________________CATEGORIES___________________________________#

get '/' do
  erb :main
end

get '/categories' do
  @categories = Categorie.all
  erb :categories_index
end

get '/categories/new' do
  erb :categories_new
end

post '/categories' do
  categorie = Categorie.new
  categorie.name = params[:name]
  categorie.website = params[:website]
  categorie.description = params[:description]
  categorie.save
  redirect '/categories'
end

get '/categories/:id' do
  @categorie = Categorie.find params[:id]
  erb :categories_show
end

get '/categories/:id/delete' do
  categorie = Categorie.find params[:id]
  categorie.destroy
  redirect '/categories'
end

get '/categories/:id/edit' do
  @categorie = Categorie.find params[:id]
  erb :categories_edit
end

post '/categories/:id' do
  categorie = Categorie.find params[:id]
  categorie.name = params[:name]
  categorie.website = params[:website]
  categorie.description = params[:description]
  categorie.save
  redirect "/categories/#{params[:id]}"
end
