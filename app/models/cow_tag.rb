class CowTag < ApplicationRecord
  belongs_to :cow
  belongs_to :tag
  validates_uniqueness_of :tag_id, uniqueness: { scope: :cow_id,
    message: "Tag already exists for cow" }
end
