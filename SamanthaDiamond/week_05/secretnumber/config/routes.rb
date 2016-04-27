Rails.application.routes.draw do
    root :to => 'pages#home'

    get '/results' => 'results#results'

end
