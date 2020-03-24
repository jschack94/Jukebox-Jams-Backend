class User < ApplicationRecord
    has_many :playlists

  
    def access_token_expired?
      #return true if access_token is older than 55 minutes, based on update_at
      (Time.now - self.updated_at) > 3300
    end
  
    def refresh_access_token
      # Check if user's access token has expired
      if access_token_expired?
        #Request a new access token using refresh token
        #Create body of request
        body = {
          grant_type: "refresh_token",
          refresh_token: self.refresh_token,
          client_id: "3bb241407ffc40beb7816439938b914f",
          client_secret: "460c6e46fdde4350894c3634e3cb0cb3"
        }
        # Send request and updated user's access_token
        auth_response = RestClient.post('https://accounts.spotify.com/api/token', body)
        auth_params = JSON.parse(auth_response)
        self.update(access_token: auth_params["access_token"])
      else
        puts "Current user's access token has not expired"
      end
    end
end
  