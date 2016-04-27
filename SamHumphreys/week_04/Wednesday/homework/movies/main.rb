require "sinatra"
require "sinatra/reloader"
require "httparty"
require "pry"


get "/" do
  erb :home
end

get "/home" do
  erb :home
end

get "/check" do
  @movie = params[:movie]
  @result = HTTParty.get "http://www.omdbapi.com/?t=#{@movie}"

  @poster = @result["Poster"]
  @year = @result["Year"]
  @rating = @result["Rated"]
  @director = @result["Director"]
  @stars = @result["Actors"]

  erb :results
end

get "/lookup" do
  @search = params[:search]
  @results = HTTParty.get "http://omdbapi.com/?s=#{@search}"
  @s_results = @results["Search"]

  binding.pry

  erb :search

end
