require 'graphlient'

RSpec.shared_context 'GraphQL Client', shared_context: :metadata do |url:'https://api.example.org/api'|
  let(:client) do
    Graphlient::Client.new(url) do |client|
      client.http do |h|
        h.connection do |c|
          c.adapter Faraday::Adapter::Rack, app
        end
      end
    end
  end

  def authorize_user(user)
    client.options[:headers] = {'Authorization' => "Token token=\"#{user.authentication_token}\""}
  end

  def set_source(source)
    if client.options[:headers].blank?
      client.options[:headers] = {'SOURCE' => source}
    else
      client.options[:headers]['SOURCE'] = source
    end
  end
end
