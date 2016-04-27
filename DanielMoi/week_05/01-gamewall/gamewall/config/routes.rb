# TODO Can we have numbers in names?

Rails.application.routes.draw do

  root :to => 'pages#home'

  get '/magic8ball' => 'magic8ball#home'
  get 'magic8ball/answer' => 'magic8ball#answer'

  get 'secretnumber' => 'secretnumber#home'
  get 'secretnumber/answer' => 'secretnumber#answer'

  get 'rockscissorspaper' => 'rockscissorspaper#home'
  get 'rockscissorspaper/result' => 'rockscissorspaper#result'

end
