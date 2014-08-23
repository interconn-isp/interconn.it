FactoryGirl.define do
  factory :inquiry do
    full_name { Faker::Name.name }
    email { Faker::Internet.email }
  end
end
