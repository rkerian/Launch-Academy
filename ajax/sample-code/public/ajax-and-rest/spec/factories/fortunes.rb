FactoryGirl.define do
  factory :fortune do
    sequence(:content) { |n| "Generic fortune ##{n}" }
  end
end
