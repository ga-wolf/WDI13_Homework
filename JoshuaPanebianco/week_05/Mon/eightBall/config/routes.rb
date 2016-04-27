Rails.application.routes.draw do
 root :to => 'pages#home'
 get '/result' => 'pages#result'
 get '/number' => 'pages#number'
 get '/secret_number' => 'pages#number'
 get '/paper' => 'pages#paper'
end
