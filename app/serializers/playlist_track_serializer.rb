class PlaylistTrackSerializer < ActiveModel::Serializer
  attributes :id, :track_id, :playlist_id
end
