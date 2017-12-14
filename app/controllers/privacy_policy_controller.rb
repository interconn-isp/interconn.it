# frozen_string_literal: true

require 'net/http'

class PrivacyPolicyController < ApplicationController
  def show
    @policy = Iubenda::Client.get_policy(ENV['IUBENDA_POLICY_ID'],
      no_markup: true,
      convert_breaks: true
    )
  end
end
