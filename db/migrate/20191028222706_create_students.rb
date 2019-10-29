class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :education_level
      t.text :description
      t.text :subjects_of_interest
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
