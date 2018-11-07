# frozen_string_literal: true

FactoryBot.define do
  factory :inquiry do
    full_name { Faker::Name.name }
    email { Faker::Internet.email }
    phone { '3926178192' }
    address { Faker::Address.street_address }
    product { Inquiry.product.values.sample }
  end
end
