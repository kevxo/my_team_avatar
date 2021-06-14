require 'rails_helper'

describe 'Avatar Team API' do
  it 'can create a Avatar Team', :vcr do
    user = create(:user)

    team = {
      'name': 'Team Hero',
      'count': 3,
      'api_key': user.api_key
    }

    post '/api/v1/avatar_team', params: team.to_json,
                                headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    avatar_team = json[:data]

    expect(avatar_team).to be_a Hash
    expect(avatar_team).to have_key :type
    expect(avatar_team[:type]).to eq('avatar_team')
    expect(avatar_team).to have_key :attributes
    expect(avatar_team[:attributes].keys).to eq(%i[team_name avatar team])
    expect(avatar_team[:attributes][:team_name]).to be_a String
    expect(avatar_team[:attributes][:avatar]).to be_a Hash
    expect(avatar_team[:attributes][:team]).to be_a Array
  end

  it 'fails with incorrect api_key' do
    team = {
      'name': 'Team Hero',
      'count': 3,
      'api_key': 'bfhiwebfiuwbiukcnjdqnj'
    }

    post '/api/v1/avatar_team', params: team.to_json,
                                headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }

    expect(response).to_not be_successful
    expect(response.status).to eq(401)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to have_key :error
    expect(json[:error]).to eq('Unauthorized')
  end

  it 'can work without giving a count', :vcr do
    user = create(:user)

    team = {
      'name': 'Team Hero',
      'api_key': user.api_key
    }

    post '/api/v1/avatar_team', params: team.to_json,
                                headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    avatar_team = json[:data]

    expect(avatar_team[:attributes][:team]).to be_a Array
    expect(avatar_team[:attributes][:team].length).to eq(3)
  end
end
