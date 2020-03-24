class Song < ApplicationRecord
    has_many :playlist_songs
    has_many :playlists, through: :playlist_songs

    def self.new_from_spotify_song(spotify_song)
        Song.new(
          spotify_id: spotify_song.id,
          name: spotify_song.name,
          artists: spotify_song.artists[0].name,
          image: spotify_song.album.images[0]["url"],
          duration: spotify_song.duration_ms,
          popularity: spotify_song.popularity,
          preview: spotify_song.preview_url
        )
      end
    
      def self.create_from_spotify_song(spotify_song)
        song = self.new_from_spotify_song(spotify_song)
        song.save
        song
      end
    end