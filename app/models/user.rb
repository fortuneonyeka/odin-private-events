class User < ApplicationRecord
  validates :name, length: { minimum: 4 }
  validates :password, length: { in: 6..20 }


  has_many :events, inverse_of: :creator
  has_many :enrollment
  has_many :attended_events, through: :enrollment, source: :event
end
