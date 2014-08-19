class Ticket < ActiveRecord::Base
  validates :full_name, :email, :message, presence: true
  validates :email, format: { with: /@/ }
end
