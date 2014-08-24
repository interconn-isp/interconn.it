require 'clockwork'

require File.expand_path('../config/boot', __FILE__)
require File.expand_path('../config/environment', __FILE__)

module Clockwork
  every(1.day, 'stale_inquiries', at: '00:00') do
    StaleInquiriesWorker.perform_async
  end
end
