Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users do
        resources :playlists
      end
        get '/current_user', to: 'auth#create'
        get '/profile', to: 'users#profile'
        get '/signup', to: 'auth#create'
        post '/login', to: 'auth#create'
      resources :playlist_tracks
      resources :tracks do
        collection do
          get :top_100
          get :random
          get :search
          get :surprise
        end
      end
    end
  end
end

  

 
