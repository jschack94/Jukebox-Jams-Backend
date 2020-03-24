class Api::V1::PlaylistTracksController < ApplicationController

    def index
      @playlist_tracks = PlaylistTrack.all
      render json: @playlist_tracks
    end


    # def create
    #   @playlist_track = PlaylistTrack.create(playlist_track_params)
    #   render json: @playlist_track
    # end

    def create
      # byebug
      # see if this track exists in the db
      track = Track.find_by(spotify_id: params[:spotify_id])
      # byebug
      # unless !track
      if !track
        # find the spotify song from the api
        s_track = RSpotify::Track.find(params[:spotify_id])
        # create a new track
        track = Track.create_from_spotify_track(s_track)
      end

      @playlist_track = PlaylistTrack.create(playlist_id: playlist_track_params[:playlist_id], track_id: track.id)

      render json: @playlist_track
    end


    def update
      @playlist_track = PlaylistTrack.find(params[:id])
      @playlist_track.update(playlist_track_params)
      render json: @playlist_track
    end

    def destroy
      @playlist_track = PlaylistTrack.find(params[:id])
      @playlist_track.destroy
    end


    private

    def playlist_track_params
      params.permit(:track_id, :playlist_id)
    end
end