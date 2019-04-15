class User < ApplicationRecord
  has_many :events, :dependent => :destroy
  has_many :bookings, :dependent => :destroy
end
