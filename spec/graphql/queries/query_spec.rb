require 'rails_helper'

describe 'GraphQL Query', type: :request do
  include_context 'GraphQL Client'

  it 'retrieves schema' do
    expect(client.schema.query.fields.keys).to match_array([
      'healt'
    ])
  end
end
