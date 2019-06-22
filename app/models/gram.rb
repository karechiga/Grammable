class Gram < ApplicationRecord
  mount_uploader :picture, PictureUploader
  
  validates :message, presence: true, length: { minimum: 3 }
  validates :picture, presence: true

  belongs_to :user
end
