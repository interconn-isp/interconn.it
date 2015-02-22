class FAQ < ActiveYaml::Base
  field :category_id
  field :question
  field :answer

  include ActiveHash::Associations
  belongs_to :category, class_name: 'FAQCategory', foreign_key: 'category_id'
end
