RSpotify::authenticate("3bb241407ffc40beb7816439938b914f", "460c6e46fdde4350894c3634e3cb0cb3")

class Api::V1::SongsController < ApplicationController
    def index
        
      @songs = Song.all
      
  render json: @songs
    end
  
    def top_100
        # byebug
        # top 100 playlist for 2019 tracks
        # https://open.spotify.com/playlist/2kpoUUJ5a4Cw3feTkFJhZ2
        s_songs = RSpotify::Playlist.find("1276640268","2kpoUUJ5a4Cw3feTkFJhZ2").tracks
        @songs = s_songs.map do |s_song|
          Song.new_from_spotify_song(s_song)
        end
    end
end
    