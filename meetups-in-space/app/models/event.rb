class Event < ActiveRecord::Base
  belongs_to :meetup
  has_many :users, through: :attendance
  has_many :comments
end
