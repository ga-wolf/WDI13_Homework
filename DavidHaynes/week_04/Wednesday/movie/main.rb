require "pry"
require "sinatra"
require "sinatra/reloader"
require "httparty"

get "/" do
  erb :home
end

get "/movie" do
    @movie_search = params["movie_search"]
    @search_results = HTTParty.get "http://omdbapi.com?t=#{@movie_search}"
    @movie_poster = @search_results["Poster"]
    # binding.pry
    erb :results

end
