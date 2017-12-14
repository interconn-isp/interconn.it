# frozen_string_literal: true

class Testimonial < ActiveYaml::Base
  field :customer_name
  field :customer_image
  field :text

  def self.with_customer_image
    all.select { |t| t.customer_image.present? }
  end
end
