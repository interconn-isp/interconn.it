# frozen_string_literal: true

Capybara.asset_host = ENV['DOMAIN']
Capybara.server = :puma, { Silent: true }
