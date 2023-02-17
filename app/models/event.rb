class Event < ApplicationRecord
  validates :name,:date, :location, :description, presence: true
  validates :description, length: { minimum: 20 }
  validates :name, length: { minimum: 10 }
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :attendance
  has_many :attendees, through: :attendance, source: :user
end
