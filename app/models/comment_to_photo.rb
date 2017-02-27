class CommentToPhoto < ApplicationRecord
  belongs_to :user
  belongs_to :photo
  belongs_to :place
end
