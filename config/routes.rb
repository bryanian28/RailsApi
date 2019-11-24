Rails.application.routes.draw do

  resources :users, param: :_username
  post '/login', to: 'authentication#login'
  # get '/*a', to: 'application#not_found'
  # get 'users/create'
  resources :articles

end
