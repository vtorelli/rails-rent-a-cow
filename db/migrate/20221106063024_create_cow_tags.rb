class CreateCowTags < ActiveRecord::Migration[7.0]
  def change
    create_table :cow_tags do |t|
      t.references :cow, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
