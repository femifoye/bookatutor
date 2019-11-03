class Tutor < ApplicationRecord
  belongs_to :user

  serialize :work_experience, Array
  #store_accessor :work_experience, :company, :location, :title, :from, :to 

  serialize :education 
  serialize :subjects
end
