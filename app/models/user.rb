require 'bcrypt'
class User < ApplicationRecord
  has_many :playlists

  has_secure_password
  validates :name, :username, :password, presence: :true
end