Rails.application.routes.draw do
    root :to => 'pages#home'

    get '/fortunes' => 'fortunes#fortune'
end
