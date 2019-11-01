class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.datetime :date
      t.string :location
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
