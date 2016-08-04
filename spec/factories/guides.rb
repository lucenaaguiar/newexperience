FactoryGirl.define do
  factory :guide do
    sequence(:name) { |n| "Guia_#{n}" }
    location 'Sao Paulo, SP'
    phone '12 32342312'
    sequence(:email) { |n| "guia_#{n}@email.com" }
    password '12345567'
  end
end
