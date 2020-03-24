class Api::V1::PlaylistsController < ApplicationController
    # skip_before_action :verify_authenticity_token
    
      def index
        @playlists = Playlist.all
        render json: @playlists
      end
    
      def show
      end
    
      def create
        @playlist = Playlist.create(playlist_params)
        render json: @playlist
      end
    
    
      # def create
      #   # byebug
      #   # see if this track exists in the db
      #   track = Track.find_by(spotify_id: params[:spotify_id])
      #   unless track
      #     # find the spotify song from the api
      #     s_track = RSpotify::Track.find(params[:spotify_id])
      #     # create a new track
      #     track = Track.create_from_spotify_track(s_track)
      #   end
      #
      #   @playlist = Playlist.create(
      #     name: params[:name],
      #     user_id: params[:user_id],
      #     spotify_id: params[:spotify_id]
      #   )
      #
      #   render json: @playlist
      # end
    
      def update
        @playlist.update(playlist_params)
        render json: @playlist
      end
    
      def destroy
        @playlists = Playlist.all
        @playlist.destroy
      end
    
      private
      def find_playlist
        @playlist = Playlist.find(params[:id])
      end
    
      def playlist_params
        params.permit(:name, :user_id)
      end
    end
    