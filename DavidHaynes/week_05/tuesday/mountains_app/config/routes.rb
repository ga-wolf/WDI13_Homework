Rails.application.routes.draw do

  root :to => 'mountains#index'
  get '/mountains' => 'mountains#index'
  get '/mountains/new' => 'mountains#new'
  get '/mountains/:id' => 'mountains#show', :as => 'mountain'
  post '/mountains/:id' => 'mountains#create', :as => 'mountain_create'
  post '/mountains/:id/delete' => 'mountains#delete', :as => 'mountain_delete'
  get '/mountains/:id/edit' => 'mountains#edit', :as => 'mountain_edit'
  post '/mountains/:id/edit' => 'mountains#update', :as => 'mountain_update'
end
