require "pry"
require "sinatra"
require "sinatra/reloader"
require "httparty"

get "/" do
  erb :home
end


get "/movies" do
  @movies = params[:movies]
  @result = HTTParty.get "http://omdbapi.com?s=#{@movies}"
  erb :movies_index
end


get "/movies/:id" do
  @id = params[:id]
  @result = HTTParty.get "http://omdbapi.com?i=#{@id}"
  erb :movies_show
end


#
# get "/movie" do
#   @movie = params[:movie]
#   @result = HTTParty.get "http://omdbapi.com?t=#{@movie}"
#   @title = @result["Title"]
#   @year = @result["Year"]
#   @released = @result["Released"]
#   @genre = @result["Genre"]
#   @director = @result["Director"]
#   @plot = @result["Plot"]
#   @awards = @result["Awards"]
#   @poster = @result["Poster"]
#   @language = @result["Language"]
#   @country = @result ["Country"]
#   @runtime = @result["Runtime"]
#   erb :movie
# end
