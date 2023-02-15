class Event < ApplicationRecord
  belongs_to :creater, class_name: "User",foreign_key: "creator_id"
end
