class Cow < ApplicationRecord
  has_many :bookings
  belongs_to :user
  # has_and_belongs_to_many :tags
  has_many :cow_tags, dependent: :destroy
  has_many :tags, through: :cow_tags
  accepts_nested_attributes_for :tags

  validates :name, presence: true, uniqueness: true
  validates :description, length: { minimum: 3 }
  validates :price_per_day, numericality: { only_integer: true }
  validates :photo, presence: true

  has_one_attached :photo
end
