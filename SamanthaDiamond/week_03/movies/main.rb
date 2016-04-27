require "pry"
require "sinatra"
require "sinatra/reloader"
require "HTTParty"

get "/" do
  erb :home
end

get "/movie" do

  @title = params[:title]
  result = HTTParty.get "http://omdbapi.com/?t=#{@title}"

  if result['Poster'] == "N/A"
    @poster = url "http://fillmurray.com/200/200"
  else
    @poster = result['Poster']
  end

  get "/movie"
  @title = params[:title]
  @id = ["search"].each { |title| p title["title"] }
  result = HTTParty.get "http://omdbapi.com/?s=#{@title}"

  end

  erb :results

end


# ibmdID
