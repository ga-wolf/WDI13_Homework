# == Route Map
#
#      Prefix Verb   URI Pattern                 Controller#Action
#        root GET    /                           books#index
#       books GET    /books(.:format)            books#index
#             POST   /books(.:format)            books#create
#    new_book GET    /books/new(.:format)        books#new
#   edit_book GET    /books/:id/edit(.:format)   books#edit
#        book GET    /books/:id(.:format)        books#show
#             PATCH  /books/:id(.:format)        books#update
#             PUT    /books/:id(.:format)        books#update
#             DELETE /books/:id(.:format)        books#destroy
#     authors GET    /authors(.:format)          authors#index
#             POST   /authors(.:format)          authors#create
#  new_author GET    /authors/new(.:format)      authors#new
# edit_author GET    /authors/:id/edit(.:format) authors#edit
#      author GET    /authors/:id(.:format)      authors#show
#             PATCH  /authors/:id(.:format)      authors#update
#             PUT    /authors/:id(.:format)      authors#update
#             DELETE /authors/:id(.:format)      authors#destroy
#

Rails.application.routes.draw do
  get 'authors/index'

  get 'authors/new'

  get 'authors/edit'

  get 'authors/show'

  get 'books/new'

  get 'books/index'

  get 'books/edit'

  get 'books/show'

  root :to => 'books#index'
  resources :books, :authors
end
