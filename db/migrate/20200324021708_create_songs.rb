class CreateSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :songs do |t|
      t.string :name
      t.string :artists
      t.string :image
      t.float :duration
      t.integer :popularity
      t.string :preview
      t.string :spotify_id

      t.timestamps
    end
  end
end
