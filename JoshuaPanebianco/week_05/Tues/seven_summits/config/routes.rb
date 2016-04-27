Rails.application.routes.draw do
root :to => 'summits#home'
get '/new' => 'summits#new'
get '/index' => 'summits#index'
get '/edit' => 'summits#edit'
get '/summit/:id' => 'summits#show', :as => 'summit'
post '/summits' => 'summits#create'


end
