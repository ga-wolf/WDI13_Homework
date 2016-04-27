Rails.application.routes.draw do
  root :to => "pages#home"
  get "/eightball" => "eightball#input"
  get "/eightball/results" => "eightball#result"
end
