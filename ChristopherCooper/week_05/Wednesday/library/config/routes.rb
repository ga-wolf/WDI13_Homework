Rails.application.routes.draw do
  get 'books/index'

  get 'books/new'

  get 'books/edit'

  get 'books/show'

  get 'authors/index'

  get 'authors/new'

  get 'authors/edit'

  get 'authors/show'

  resources :authors
  resources :books
end
