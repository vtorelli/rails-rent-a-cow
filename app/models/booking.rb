class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :cow

  validates :start_date, presence: true
  validates :duration, numericality: { only_integer: true }, presence: true
  validates :location, presence: true
end
