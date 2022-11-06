class CreateJoinTableCowTag < ActiveRecord::Migration[7.0]
  def change
    create_join_table :cows, :tags do |t|
      t.index [:tag_id, :cow_id]
    end
  end
end
