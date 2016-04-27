require "sinatra"
require "sinatra/reloader"
require 'HTTParty'
require 'pry'

get "/" do
  erb :home
end

get "/movies" do

  @movie = params[:movie_id]
  @movie_url = "http://omdbapi.com/?t=#{ @movie }"
  @result = HTTParty.get @movie_url
  @poster = @result["Poster"]
  @image_url = [ @poster ]
  @image = @image_url[0]
  @year = @result["Year"]
  @actors = @result["Actors"]
  @plot = @result["Plot"]
  # binding.pry
  erb :results
end
