class AddUserBoookedToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :user_booked, :integer
  end
end
