Rails.application.routes.draw do

  root :to=> 'pages#home'

get '/eightball' => 'eightball#start'
get '/eightball/result' => 'eightball#result'

get '/secret' => 'secret#start'
get '/secret/lucky' => 'secret#lucky'
get '/secret/result' => 'secret#result'
get '/secret/count' => 'secret#count'
get '/secret/count/:num/:comp' => 'secret#counter'
get '/secret/multi/:num' => 'secret#multi'

get '/rps' => 'rps#start'
get '/rps/play/:num/:count/:win/:tie' => 'rps#play'
get '/rps/result/:num/:win/:tie' => 'rps#result'


end
