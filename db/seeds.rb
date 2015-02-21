# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file .env file.

faqs = YAML.load_file(Rails.root.join('db', 'seeds', 'faqs.yml'))['records'].map do |faq|
  FAQ.create_with(
    category: FAQCategory.find_or_create_by(name: faq['category']),
    answer: faq['answer']
  ).find_or_create_by(question: faq['question'])
end
