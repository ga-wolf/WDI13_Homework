Rails.application.routes.draw do

  root :to => 'lakes#index'
  get '/lakes' => 'lakes#index'
  get '/lakes/new' => 'lakes#new'
  post '/lakes/create' => 'lakes#create'
  get '/lakes/:id' => 'lakes#show', :as => 'lake'
  post '/lakes/:id/delete' => 'lakes#delete', :as => 'lake_delete'
  get '/lakes/:id/edit' => 'lakes#edit', :as => 'lake_edit'
  post '/lakes/:id/update' => 'lakes#update', :as => 'lake_update'
end
