FactoryGirl.define do
  factory :diagram do
    sequence(:name) { |n| "diagram_#{n}" }
  end
  factory :user do
    sequence(:name) { |n| "user_#{n}" }
  end
end
