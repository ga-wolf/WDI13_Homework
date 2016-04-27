require "pry"
require "sinatra"
require "sinatra/reloader"
require "httparty"

get "/" do

  erb :home

end

get "/movie" do

@movie = params[:movie].upcase
@result = HTTParty.get "https://omdbapi.com?t=#{@movie}"
@poster = @result["Poster"]
erb :results

end
