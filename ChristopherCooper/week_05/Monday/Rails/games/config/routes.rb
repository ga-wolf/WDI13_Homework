Rails.application.routes.draw do
  root :to => 'pages#home'

  get "/magic" => 'pages#magic'

  get "/magic/answer" => 'pages#magicanswer'



  get "/secret" => 'pages#secret'
  get "/secret/answer" => 'pages#answer'


  get "/rps" => 'pages#rps'
  get "/rps/winner" => 'pages#winner'

end
