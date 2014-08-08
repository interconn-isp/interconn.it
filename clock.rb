require 'clockwork'

require File.expand_path('../config/boot', __FILE__)
require File.expand_path('../config/environment', __FILE__)

module Clockwork
  every(30.seconds, 'contacts') do
    ContactsWorker.perform_async
  end
end
