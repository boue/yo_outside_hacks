Rails.application.routes.draw do

  get 'yo/:api_key', to: 'yos#yo'
  root 'welcome#index'
end
