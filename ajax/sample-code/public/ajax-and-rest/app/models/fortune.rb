class Fortune < ApplicationRecord
  validates :content, presence: true
end
