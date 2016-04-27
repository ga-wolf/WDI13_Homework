Rails.application.routes.draw do

  root :to => "pages#home"
  get "/home" => 'pages#home'
  get "/magiceightball" => 'eightball#playeight'
  get "/numberguess" => 'numberguess#playguess'
  get "/rps" => 'rps#play'
  get "/answer_eight" => 'eightball#answer_eight'
  get "/answer_guess" => 'numberguess#answer_guess'
  get "/rps/answer" => 'rps#answer'

end
