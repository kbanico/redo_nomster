class Place < ApplicationRecord
  belongs_to :user
  self.per_page = 10
  validates :name, presence: true
end
