require "pry"
require "sinatra"
require "sinatra/reloader"
require "httparty"

get "/" do
  erb :home
end

get "/movies" do
  @movie_title = params[:movie_title]
  @movie = HTTParty.get "http://omdbapi.com/?t=#{@movie_title}"
  @poster_result = @movie['Poster']
  @year_result = @movie['Year']
  @rating_result = @movie['Rated']
  @released_result = @movie['Released']
  @runtime_result = @movie['Runtime']
  @director_result = @movie['Director']
  @actors_result = @movie['Actors']
  @plot_result = @movie['Plot']
  @result = HTTParty.get "http://omdbapi.com/?s=#{@movie_title}"
  @movie_array = @result['Search']
  erb :results
end
