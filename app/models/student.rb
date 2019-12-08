class Student < ApplicationRecord
  serialize :subjects_of_interest, Array
  belongs_to :user

  validates :education_level, :description, :subjects_of_interest, presence: true
end
