Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      get '/avatars', to: 'avatar#index'
      get '/avatars/:avatar_id', to: 'avatar#show'
    end
  end
end
