FactoryGirl.define do
  factory :message do
    sequence(:name) { |n| "Vis_#{n}" }
    phone 'MyString'
    email 'MyString'
    date_tour Time.current
    text_msg 'texto'
  end
end
