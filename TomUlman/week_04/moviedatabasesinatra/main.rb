require "pry"
require "sinatra"
require "sinatra/reloader"
require "httparty"

get "/" do
 erb :home
end

get "/movie" do
@search = params[:search]

@result = HTTParty.get "http://omdbapi.com/?s=#{@search}"
# @array = @result["Search"]
# @poster = @result['Poster']
erb :results


end


# get "/movie" do
# @search = params[:search]
#
# @result = HTTParty.get "http://omdbapi.com/?i=#{@imdbID}"
#
# erb :individual
#
# end
