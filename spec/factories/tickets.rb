FactoryGirl.define do
  factory :ticket do
    full_name { Faker::Name.name }
    email { Faker::Internet.email }
    message { Faker::Lorem.paragraph }
  end
end
