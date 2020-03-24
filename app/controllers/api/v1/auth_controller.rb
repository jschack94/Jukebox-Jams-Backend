  require 'rest_client'
class Api::V1::AuthController < ApplicationController


  
    def spotify_request
      # User has clicked "login" button - assemble get request to Spotify to have
      # user authorize application
      query_params = {
        client_id: "3bb241407ffc40beb7816439938b914f",
        response_type: "code",
        redirect_uri: "http://localhost:3000/api/v1/user",
        scope: "user-library-read user-library-modify user-top-read user-modify-playback-state playlist-modify-public playlist-modify-private ugc-image-upload user-read-recently-played",
        show_dialog: true
      }
      url = "https://accounts.spotify.com/authorize/"
      # redirects user's browser to Spotify's authorization page, which details
      # scopes my app is requesting
      redirect_to "#{url}?#{query_params.to_query}"
    end
  
    def create
      # Placeholder
      # NOTE: tokens are created and issued in users#create, due to how data is
      # handled from Spotify and restrictions on internal redirects with post actions
    end
  
    def show
    # if application_controller#authorized is successful, return data for user
      # render json: current_user
      render json: {username: current_user.username,
                    spotify_url: current_user.spotify_url}
    end
  
  end