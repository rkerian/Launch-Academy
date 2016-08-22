class Meetup < ActiveRecord::Base
  has_many :users, through: :memberships
  has_many :events
end
