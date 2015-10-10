FactoryGirl.define do

  factory :shape do
    sequence(:label) { |n| "shape_#{n}" }
    kind { %w(rectangle circle).sample }
  end

  factory :diagram do
    sequence(:name) { |n| "diagram_#{n}" }
    factory :diagram_with_shapes do
      after(:create) do |object|
        create_list(:shape, 2, diagram: object)
      end
    end
  end
end
