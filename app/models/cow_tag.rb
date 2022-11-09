class CowTag < ApplicationRecord
  belongs_to :cow
  belongs_to :tag
  validates :tag_id, uniqueness: { scope: :cow_id, message: "Tag already exists for cow" }
end
