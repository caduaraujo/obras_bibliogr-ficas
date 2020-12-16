require 'rails_helper'

RSpec.describe 'Request to create new author', type: :request do

  it 'return an author' do
    params = { author: 'João da Silva Neto' }
    post('/v1/authors', params: params)
    expect(response.body).to eq("\"SILVA NETO, João da\"")
  end
end
