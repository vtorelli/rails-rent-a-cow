class AddIndexToCowTag < ActiveRecord::Migration[7.0]
  def change
    add_index :cow_tags, [:cow_id, :tag_id], unique: true
  end
end
