class Student < ApplicationRecord
  serialize :subject_of_interest
  belongs_to :user
end
