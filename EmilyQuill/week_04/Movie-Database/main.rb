require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'HTTParty'

get "/" do
  erb :home
end

get "/search_results" do
  @search_term = params["movie"]
  @results= HTTParty.get "http://omdbapi.com?s=#{@search_term}"
  erb :search_results
end

get "/result/:i" do
  @imdbID = params[:i]
  @movie= HTTParty.get "http://omdbapi.com?i=#{@imdbID}"
  @title = @movie["Title"]
  @year = @movie["Year"]
  @runtime = @movie["Runtime"]
  @director = @movie["Director"]
  @poster_URL = @movie["Poster"]
  erb :result
end
