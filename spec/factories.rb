FactoryGirl.define do
  factory :diagram do
    sequence(:name) { |n| "diagram_#{n}" }
  end
end
