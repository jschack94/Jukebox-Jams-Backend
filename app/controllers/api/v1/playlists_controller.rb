class Api::V1::PlaylistsController < ApplicationController
  #skip_before_action :authorized, only: [:index, :create]
    
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
    