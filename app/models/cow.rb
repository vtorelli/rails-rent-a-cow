class Cow < ApplicationRecord
  has_many :bookings

  validates :name, presence: true, uniqueness: true
  validates :description, length: { minimum: 3 }
  validates :price_per_day, numericality: { only_integer: true }
  validates :photo, presence: true

  has_one_attached :photo

end
