FactoryGirl.define do
  factory :faq do
    association :category, factory: :faq_category, strategy: :build
    question { "#{Faker::Lorem.words(5).join(' ').capitalize}?" }
    answer { Faker::Lorem.paragraph }
  end
end
