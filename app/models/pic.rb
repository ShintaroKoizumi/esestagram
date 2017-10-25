class Pic < ApplicationRecord
  validates :image, presence: true
  validates :user_id, presence: true

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_pics, through: :favorites, source: :pic

  mount_uploader :image, ImageUploader
end
