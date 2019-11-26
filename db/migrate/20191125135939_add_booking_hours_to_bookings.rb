class AddBookingHoursToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :hours_booked, :integer
  end
end
