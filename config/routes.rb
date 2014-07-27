Rails.application.routes.draw do

  get '/yo_receive/:api_key', to: 'yos#yo_receive'
  post '/yo_send', to: 'yos#yo_send'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#delete'
  get '/admin', to: 'admins#index'
  root 'welcome#index'

end
