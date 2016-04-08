require "httparty"
require "sinatra"
require "sinatra/reloader"
require "pry"

get "/" do
  erb :home
end

get "/search" do
  @movies = HTTParty.get("http://www.omdbapi.com/?s=#{params[:movie_name]}")
  # binding.pry
  erb :search
end

get "/movie/:imdbID" do
  @movie = HTTParty.get("http://www.omdbapi.com/?i=#{params[:imdbID]}")
  # binding.pry
  erb :movie_detail
end
