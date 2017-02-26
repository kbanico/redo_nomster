class Photo < ApplicationRecord
  belongs_to :place
  belongs_to :user
  has_many :comment_to_photos
  mount_uploader :picture, PictureUploader
end
