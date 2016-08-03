FactoryGirl.define do
  factory :location do
    state 'São Paulo'
    sequence(:city) { |n| "#{n}_Oz" }
  end
end
