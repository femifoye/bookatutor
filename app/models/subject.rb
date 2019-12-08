class Subject < ApplicationRecord
    validates :subject_name, presence: true
end
