require 'factory_girl'

FactoryGirl.define do
  factory :dish do
    sequence(:name) { |n| "great tasting dish #{n}"}
  end
end
