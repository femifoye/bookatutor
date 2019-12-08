class Booking < ApplicationRecord
  belongs_to :user
  has_one :lesson

  serialize :location

  validates :date, :hours_booked, presence: true
  validates :location, length:{
    in: 0..255,
    allow_blank: false
  }
end
