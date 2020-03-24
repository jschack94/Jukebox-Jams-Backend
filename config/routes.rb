Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :playlists
    end
  end
  namespace :api do
    namespace :v1 do
      resources :users
    end
  end

  namespace :api do
    namespace :v1 do
      resources :playlist_songs
    end
  end
    
  # OAuth
  namespace :api do
    namespace :v1 do
      get '/login', to: "auth#spotify_request"
      get '/auth', to: "auth#show"
      get '/user', to: "users#create"
      patch '/user', to: "users#update"
    end
  end

  namespace :api do
    namespace :v1 do
      resources :songs do
      
          collection do
            get :top_100
            get :random
            get :search
    end
  end
end
end
end
  

 
