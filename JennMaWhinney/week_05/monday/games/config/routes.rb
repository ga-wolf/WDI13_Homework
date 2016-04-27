Rails.application.routes.draw do
root :to => 'pages#home'

  get '/magic' => 'games#magic'
  get 'magic/response' => 'games#response'
end
