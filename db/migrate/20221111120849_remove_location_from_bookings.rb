class RemoveLocationFromBookings < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :location, :string
  end
end
