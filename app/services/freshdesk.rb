class Freshdesk
  attr_accessor :options

  include HTTParty

  def initialize(options = {})
    @options = options
  end

  def create_ticket(ticket_params)
    ticket = post '/helpdesk/tickets.json', ticket_params
    raise 'Ticket was not created' unless ticket.is_a?(Hash) && ticket['helpdesk_ticket']['id']
  end

  private

  %w(get post put delete).each do |method|
    define_method method do |uri, query = {}|
      self.class.send(method, make_uri(uri), auth_options.merge(query: query))
    end
  end

  def make_uri(uri)
    "https://#{options[:freshdesk_domain]}#{uri}"
  end

  def auth_options
    {
      basic_auth: {
        username: options[:freshdesk_api_key],
        password: 'X'
      }
    }
  end
end
