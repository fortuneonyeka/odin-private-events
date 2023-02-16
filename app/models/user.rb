class User < ApplicationRecord
  has_many :events, inverse_of: :creator
  has_many :attendance
  has_many :attendees through: :attendance, source: :event
end
