class FAQ < ActiveRecord::Base
  belongs_to :category, class_name: 'FAQCategory', foreign_key: 'category_id', inverse_of: :faqs

  validates :category, presence: true
  validates :question, presence: true
  validates :answer, presence: true
end
