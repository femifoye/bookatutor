class Tutor < ApplicationRecord
  belongs_to :user

  serialize :work_experience, Array

  serialize :education, Array
  serialize :subjects, Array
  serialize :dates_booked, Array

  validates :headline, :description, :years_teaching, :teaching_style, :work_experience, :education, :subjects, presence: true
end
