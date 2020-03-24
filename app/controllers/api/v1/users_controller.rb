require 'rest_client'

class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def create
    # Request refresh and access tokens
    body = {
      grant_type: "authorization_code",
      code: params[:code],
      redirect_uri: 'http://localhost:3000/api/v1/user',
      client_id: "3bb241407ffc40beb7816439938b914f",
      client_secret: "460c6e46fdde4350894c3634e3cb0cb3"
    }

    auth_response = RestClient.post('https://accounts.spotify.com/api/token', body)
    auth_params = JSON.parse(auth_response.body)
    header = {
      Authorization: "Bearer #{auth_params["access_token"]}"
    }

    user_response = RestClient.get("https://api.spotify.com/v1/me", header)
    user_params = JSON.parse(user_response.body)
    
    #Create User 
    @user = User.find_or_create_by(
      username: user_params["display_name"], 
      spotify_url: user_params["external_urls"]["spotify"],
      href: user_params["href"],
      uri: user_params["uri"])
      

@user.update(access_token:auth_params["access_token"], refresh_token: auth_params["refresh_token"])
    #Redirect to Front End app homepage
    redirect_to "http://localhost:3001"
  end

  def update
  end
  

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
  end

  private

  def user_params
    params.require(:user).permit(:id, :username, :spotify_url, :href, :uri, :access_token, :refresh_token)
  end
end