class Booking < ApplicationRecord
  belongs_to :user
  has_one :lesson

  serialize :location

  validates :date, :location, :hours_booked, presence: true
end
