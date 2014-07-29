FactoryGirl.define do
  factory :inquiry do
    address { Faker::Address.street_address }
    email { Faker::Internet.email }
  end
end
