require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'httparty'

get "/" do
  erb :home
end

get "/search" do
  @movieName = params["movie"]
  @result = HTTParty.get "http://omdbapi.com/?s=#{@movieName}"
  @list = @result["Search"]

  if @list.length ==1
    @movie = @list[0]["Title"]
    @result = HTTParty.get "http://omdbapi.com/?t=#{@movie}"
    erb :movie
  else
   erb :searchlist
 end
 end

get "/show" do
 @movie = params[:movie]
 @result = HTTParty.get "http://omdbapi.com/?t=#{@movie}"


 erb :movie

end
