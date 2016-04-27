Rails.application.routes.draw do
  #below is homepage
  root :to => 'pages#home'

  get '/magic8ball' => 'magic8ball#ask'
  get '/magic8ball/result' => 'magic8ball#result'

  get '/secretnumber' => 'secretnumber#guess'
  get '/secretnumber/result' => 'secretnumber#result'

  get '/rockpaperscissors' => 'rockpaperscissors#pick'
  get '/rockpaperscissors/result' => 'rockpaperscissors#result'
  #
  # get '/movies' => 'movies#search'
  # get '/movies/result' => 'movies#result'

end
