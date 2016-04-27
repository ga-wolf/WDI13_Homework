# == Route Map
#
#        Prefix Verb   URI Pattern                 Controller#Action
#   authors_new GET    /authors/new(.:format)      authors#new
# authors_index GET    /authors/index(.:format)    authors#index
#  authors_edit GET    /authors/edit(.:format)     authors#edit
#  authors_show GET    /authors/show(.:format)     authors#show
#       authors GET    /authors(.:format)          authors#index
#               POST   /authors(.:format)          authors#create
#    new_author GET    /authors/new(.:format)      authors#new
#   edit_author GET    /authors/:id/edit(.:format) authors#edit
#        author GET    /authors/:id(.:format)      authors#show
#               PATCH  /authors/:id(.:format)      authors#update
#               PUT    /authors/:id(.:format)      authors#update
#               DELETE /authors/:id(.:format)      authors#destroy
#         books GET    /books(.:format)            books#index
#               POST   /books(.:format)            books#create
#      new_book GET    /books/new(.:format)        books#new
#     edit_book GET    /books/:id/edit(.:format)   books#edit
#          book GET    /books/:id(.:format)        books#show
#               PATCH  /books/:id(.:format)        books#update
#               PUT    /books/:id(.:format)        books#update
#               DELETE /books/:id(.:format)        books#destroy
#

Rails.application.routes.draw do
  get 'books/index'

  get 'books/new'

  get 'books/edit'

  get 'books/show'

  get 'authors/new'

  get 'authors/index'

  get 'authors/edit'

  get 'authors/show'

  resources :authors
  resources :books
end
