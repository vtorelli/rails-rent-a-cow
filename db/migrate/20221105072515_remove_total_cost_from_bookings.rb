class RemoveTotalCostFromBookings < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :total_cost, :integer
  end
end
