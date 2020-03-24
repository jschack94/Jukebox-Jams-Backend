class TrackSerializer < ActiveModel::Serializer
  attributes :id, :name, :artists, :image, :duration, :popularity, :preview, :spotify_id
end