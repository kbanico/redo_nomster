class Photo < ApplicationRecord
  belongs_to :place
  belongs_to :user
  has_many :comment_to_photos


  mount_uploader :picture, PictureUploader

  validates :caption, presence: true, length: {minimum: 3, maximum: 100}
  validates :picture, presence: true
end
