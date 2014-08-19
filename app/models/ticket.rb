class Ticket < ActiveRecord::Base
  validates :full_name, :email, :message, :subject, presence: true
  validates :email, format: { with: /@/ }
end
