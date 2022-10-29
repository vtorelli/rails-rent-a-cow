class CreateCows < ActiveRecord::Migration[7.0]
  def change
    create_table :cows do |t|
      t.string :name
      t.text :description
      t.integer :price_per_day
      t.string :image_url

      t.timestamps
    end
  end
end
