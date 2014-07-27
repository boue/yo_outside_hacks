Rails.application.routes.draw do

  get 'yo/:api_key', to: 'yos#yo'
  get '/admin', to: 'admins#index'
  get '/admin/yo', to: 'admins#yo'
  root 'welcome#index'
  
end
