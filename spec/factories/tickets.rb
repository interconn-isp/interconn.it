FactoryGirl.define do
  factory :ticket do
    full_name { Faker::Name.name }
    email { Faker::Internet.email }
    sequence(:subject) { |n| "Ticket #{n}" }
    message { Faker::Lorem.paragraph }
    category { Ticket.category.values.sample }
  end
end
