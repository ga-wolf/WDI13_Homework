Rails.application.routes.draw do

  root :to => 'oceans#index'
  get '/oceans' => 'oceans#index'
  get '/oceans/new' => 'oceans#new'
  get '/oceans/:id' => 'oceans#show', :as => 'ocean'
  post '/oceans' => 'oceans#create'
  get '/oceans/:id/edit' => 'oceans#edit', :as => 'ocean_edit'
  post '/oceans/:id' => 'oceans#update'
  post '/oceans/:id/delete' => 'oceans#delete', :as => 'ocean_delete'
end
