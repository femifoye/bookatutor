class Review < ApplicationRecord
  belongs_to :user

  validates :review_content, :review_stars, presence: true
end
