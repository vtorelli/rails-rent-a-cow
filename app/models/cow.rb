class Cow < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :description, length: { minimum: 3 }
  validates :price_per_day, numericality: { only_integer: true }
  validates :image_url, presence: true
end
