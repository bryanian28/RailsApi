Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'tokens/create'
      resources :tokens, only: [:create]
    end
  end

  namespace :api do
    namespace :v1 do
      # get 'users/create'
      resources :users
    end
  end

  namespace 'api' do
    namespace 'v1' do
      resources :articles
    end
  end
end
