class DropTables < ActiveRecord::Migration[5.1]
  def change
    drop_table :subjects
    drop_table :tutor_profiles
    drop_table :student_profiles
    drop_table :messages
    drop_table :reviews
    drop_table :payments
    drop_table :bookings
    drop_table :tutoring_sessions
  end
end
