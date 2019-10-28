class CreateTutors < ActiveRecord::Migration[5.1]
  def change
    create_table :tutors do |t|
      t.text :headline
      t.text :description
      t.integer :years_teaching
      t.string :teaching_style
      t.text :work_experience
      t.text :education
      t.text :subjects
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
