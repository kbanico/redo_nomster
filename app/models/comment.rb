class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :place

  validates :message, presence: true, length: {minimum: 3, maximum: 200}

  RATINGS = {
    "one star": "1_star",
    "two star": "2_star",
    "three star": "3_star",
    "four star": "4_star",
    "five star": "5_star",
  }

  def humanized_rating
    RATINGS.invert[self.rating]
  end
end
