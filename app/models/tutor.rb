class Tutor < ApplicationRecord
  belongs_to :user

  serialize :work_experience, Array
  #accepts_nested_attributes_for :work_experience
  #attr_accessor :company, :location

  #store :work_experience, accessors: [:company, :location]

  # def model_hash
  #   self.work_experience.collect{|k,v| [k,v]}
  # end

  serialize :education, Array
  serialize :subjects, Array
end
