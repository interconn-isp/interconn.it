class Ticket < ActiveRecord::Base
  validates :full_name, :email, :message, presence: true
  validates :email, format: { with: /@/ }

  scope :unprocessed, -> { where processed: false }

  def mark_as_processed!
    update_column :processed, true
  end
end
