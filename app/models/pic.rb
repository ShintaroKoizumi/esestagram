class Pic < ApplicationRecord
  validates :image, presence: true
  validates :user_id, presence: true

  belongs_to :user
  has_many :comments, dependent: :destroy

  mount_uploader :image, ImageUploader
end
