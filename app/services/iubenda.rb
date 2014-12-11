module Iubenda
  class Client
    class << self
      def get_policy(policy_id, options = {})
        uri = make_policy_uri(policy_id, options)
        response = Net::HTTP.get(uri)

        parse_response(response, options)
      end

      private

      def make_policy_uri(policy_id, options = {})
        uri = "http://www.iubenda.com/api/privacy-policy/#{policy_id}"
        uri += '/no-markup' if options[:no_markup]

        URI(uri)
      end

      def parse_response(response, options = {})
        parsed_response = JSON.parse(response)

        unless parsed_response['success']
          raise ResponseError, parsed_response['error']
        end

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
