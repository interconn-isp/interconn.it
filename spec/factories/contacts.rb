FactoryGirl.define do
  factory :contact do
    full_name { Faker::Name.name }
    email { Faker::Internet.email }
    message { Faker::Lorem.paragraph }
    source_ip '127.0.0.1'
    processed false
  end
end
