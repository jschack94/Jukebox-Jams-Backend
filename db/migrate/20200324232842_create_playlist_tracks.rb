class CreatePlaylistTracks < ActiveRecord::Migration[6.0]
  def change
    create_table :playlist_tracks do |t|
      t.integer :track_id
      t.integer :playlist_id

      t.timestamps
    end
  end
end
