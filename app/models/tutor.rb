class Tutor < ApplicationRecord
  belongs_to :user

  serialize :work_experience 
  serialize :education 
  serialize :subjects
end
