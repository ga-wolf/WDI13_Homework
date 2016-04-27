require "sinatra"
require "sinatra/reloader"
require "pry"
require "HTTParty"
# require "omdb"

get "/" do
  erb :home
end

get "/search" do
@title = params[:title]
@result = HTTParty.get "http://omdbapi.com?t=#{@title}"
erb :results
end
