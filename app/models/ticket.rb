class Ticket < ActiveRecord::Base
  validates :full_name, :email, :message, :subject, presence: true
  validates :email, format: { with: /@/ }
  validates :subject, length: { minimum: 4 }
  validates :message, length: { minimum: 10 }
end
