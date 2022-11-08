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

  def add_tag(name)
    tag = Tag.find_or_create_by(name: name)
    cow_tag = CowTag.create(tag: tag, cow: self)
    tag
  end

  private

  def new_tag_attributes=(tag_attributes)
    tag_attributes.each_value do |tag_attribute|
      tag1 = Tag.find_or_create_by!(tag_attribute)
      CowTag.find_or_create_by!(cow: self, tag: tag1)
    end
  end
end
