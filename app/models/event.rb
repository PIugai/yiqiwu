class Event < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :user_id, presence: true
  validates :type, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :location, presence: true
end
