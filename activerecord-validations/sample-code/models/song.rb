class Song < ActiveRecord::Base
  validates :year, numericality: true, length: { is: 4 }
end
