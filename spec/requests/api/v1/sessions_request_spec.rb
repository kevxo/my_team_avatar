require 'rails_helper'

describe 'Sessions' do
  it 'user can login' do
    user = create(:user)

    login = {
      'email': user.email,
      'password': user.password
    }

    post '/api/v1/sessions', params: login.to_json,
                             headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

    expect(response).to be_successful
    expect(response.status).to eq(200)

    json = JSON.parse(response.body, symbolize_names: true)
    expect(json).to be_a Hash
    expect(json).to have_key :data
    expect(json[:data]).to have_key :attributes
    expected = %i[email api_key]
    expect(json[:data][:attributes].keys).to eq(expected)
    expect(json[:data][:attributes][:email]).to be_a String
    expect(json[:data][:attributes][:api_key]).to be_a String
  end

  it 'can\'t login because of invalid credentials' do
    user = create(:user)

    login = {
      'email': user.email,
      'password': 'bcuidbslvbsa'
    }

    post '/api/v1/sessions', params: login.to_json,
                             headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

    expect(response).to_not be_successful
    expect(response.status).to eq(400)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to be_a Hash
    expect(json).to have_key :error
    expect(json[:error]).to eq('Credentials are incorrect')
  end
end
