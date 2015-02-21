FactoryGirl.define do
  factory :faq_category do
    sequence(:name) { |n| "FAQ Category #{n}" }
  end
end
