Rails.application.routes.draw do

root :to => 'pages#home'

get '/magic_question' => 'magic#magic_question'
get '/magic_answer' => 'magic#magic_answer'

get '/form' => 'secret#form'
get '/result' => 'secret#result'

get '/game' => 'rock_paper_scissors#game'
get '/rock_paper_scissors/:throw' => 'rock_paper_scissors#result'

end
