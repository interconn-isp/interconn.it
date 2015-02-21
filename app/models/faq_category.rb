class FAQCategory < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :faqs, inverse_of: :category, foreign_key: 'category_id', dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true
end
