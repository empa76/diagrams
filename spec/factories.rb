FactoryGirl.define do

  factory :share do
    association :user
    association :diagram
  end

  factory :diagram do
    sequence(:name) { |n| "diagram_#{n}" }
  end

  factory :user do
    sequence(:name) { |n| "user_#{n}" }

    factory :user_with_diagram do
      after(:create) do |object|
        create_list(:share, 2, user: object)
      end
    end
  end
end
