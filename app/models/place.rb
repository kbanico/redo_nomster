class Place < ApplicationRecord
  belongs_to :user
  has_many :comments


  has_many :place_categories
  has_many :categories, through: :place_categories
  self.per_page = 10
  validates :name, presence: true, length: {minimum: 3, maximum: 30}
  validates :description, presence: true, length: {minimum: 10, maximum: 300}
  validates :address, presence: true, length: {minimum: 5, maximum: 100}

  geocoded_by :address
  after_validation :geocode
end
