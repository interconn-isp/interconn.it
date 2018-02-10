# frozen_string_literal: true

module Iubenda
  class Client
    class << self
      def get_policy(policy_id, options = {})
        uri = make_policy_uri(policy_id, options)
        response = RestClient.get(uri).body

        parse_response(response, options)
      end

      private

      def make_policy_uri(policy_id, options = {})
        uri = "http://www.iubenda.com/api/privacy-policy/#{policy_id}"
        uri += '/no-markup' if options[:no_markup]

        uri
      end

      def parse_response(response, options = {})
        parsed_response = JSON.parse(response)

        fail ResponseError, parsed_response['error'] unless parsed_response['success']

        content = parsed_response['content']

        if options[:convert_breaks]
          content.gsub!('<br>', '</p><p>')
          content.gsub!('<br/>', '</p><p>')
          content.gsub!('<br />', '</p><p>')
        end

        content
      end
    end

    class ResponseError < StandardError
    end
  end
end
