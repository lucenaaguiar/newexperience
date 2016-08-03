FactoryGirl.define do
  factory :category do
    sequence(:name) { |n| "Aventura_#{n}" }
  end
end
