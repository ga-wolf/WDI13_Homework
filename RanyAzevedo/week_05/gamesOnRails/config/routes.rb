Rails.application.routes.draw do
  root :to => 'games#home'
  get '/games/rock_paper_scissors' => 'games#rock_paper_scissors_play'
  get '/games/rock_paper_scissors/result' => 'games#result'

  get '/magic' => 'magic#play'
  get '/magic/result' => 'magic#result'

  get '/secret' => 'secret#play'
  get '/secret/result' => 'secret#result'

  get '/rpsgame' => 'rpsgame#play'
  get '/rpsgame/result' => 'rpsgame#result'

end
