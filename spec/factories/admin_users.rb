FactoryGirl.define do
  factory :admin_user do
    email { Faker::Internet.email }
    password { SecureRandom.hex }
    password_confirmation { password }
  end
end
