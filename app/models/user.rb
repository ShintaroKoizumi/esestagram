class User < ApplicationRecord
  validates :user_name, presence: true, length: { minimum: 4, maximum: 16 }

  mount_uploader :avatar, AvatarUploader

  has_many :pics, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
