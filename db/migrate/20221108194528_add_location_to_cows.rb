class AddLocationToCows < ActiveRecord::Migration[7.0]
  def change
    add_column :cows, :location, :string
  end
end
