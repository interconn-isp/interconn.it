require 'clockwork'

require './config/boot'
require './config/environment'

module Clockwork
  every(30.seconds, 'contacts') do
    ContactsWorker.perform_async
  end

  every(1.minute, 'inquiries') do
    InquiriesWorker.perform_async
  end
end
