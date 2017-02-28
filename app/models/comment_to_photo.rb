class CommentToPhoto < ApplicationRecord
  belongs_to :user
  belongs_to :photo
  belongs_to :place
  validates :photo_comment, presence: true, length: {minimum: 3, maximum:100 }


end
