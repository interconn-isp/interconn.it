# frozen_string_literal: true

require 'webmock/rspec'

RSpec.configure do |_config|
  WebMock.disable_net_connect!(allow_localhost: true)
end
