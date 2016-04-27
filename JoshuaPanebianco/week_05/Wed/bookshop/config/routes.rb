# == Route Map
#
#       Prefix Verb   URI Pattern                Controller#Action
#    books_new GET    /books/new(.:format)       books#new
#  books_index GET    /books/index(.:format)     books#index
#   books_edit GET    /books/edit(.:format)      books#edit
#   books_show GET    /books/show(.:format)      books#show
#        books GET    /books(.:format)           books#index
#              POST   /books(.:format)           books#create
#     new_book GET    /books/new(.:format)       books#new
#    edit_book GET    /books/:id/edit(.:format)  books#edit
#         book GET    /books/:id(.:format)       books#show
#              PATCH  /books/:id(.:format)       books#update
#              PUT    /books/:id(.:format)       books#update
#              DELETE /books/:id(.:format)       books#destroy
# author_index GET    /author(.:format)          author#index
#              POST   /author(.:format)          author#create
#   new_author GET    /author/new(.:format)      author#new
#  edit_author GET    /author/:id/edit(.:format) author#edit
#       author GET    /author/:id(.:format)      author#show
#              PATCH  /author/:id(.:format)      author#update
#              PUT    /author/:id(.:format)      author#update
#              DELETE /author/:id(.:format)      author#destroy
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

resources :books, :author

end
