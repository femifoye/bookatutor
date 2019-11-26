class AddDatesBookedToTutorsTable < ActiveRecord::Migration[5.1]
  def change
    add_column :tutors, :dates_booked, :text
  end
end
