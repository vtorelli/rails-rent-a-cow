class Tag < ApplicationRecord
  # has_and_belongs_to_many :cows
  has_many :cow_tags, dependent: :destroy
  has_many :cows, through: :cow_tags
  accepts_nested_attributes_for :cows

  validates :name, uniqueness: true
end
