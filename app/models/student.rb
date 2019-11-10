class Student < ApplicationRecord
  serialize :subjects_of_interest, Array
  belongs_to :user
end
