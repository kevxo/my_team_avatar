require 'rails_helper'

describe 'Avatar API' do
  it 'retrieves all avatars', :vcr do
    get '/api/v1/avatars'

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    avatar = json[:data].first

    expect(avatar).to have_key :type
    expect(avatar[:type]).to eq('avatar')

    expect(avatar).to have_key :attributes
    expect(avatar[:attributes].keys).to eq(%i[id name weapons profession])

    expect(avatar[:attributes][:id]).to be_a String
    expect(avatar[:attributes][:name]).to be_a String
    expect(avatar[:attributes][:weapons]).to be_a String
    expect(avatar[:attributes][:profession]).to be_a String
  end

  it 'retrieves one avatar', :vcr do
    avatar = AvatarFacade.all_avatars.first

    get "/api/v1/avatars/#{avatar.id}"

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    avatar = json[:data]
    expect(avatar).to have_key :type
    expect(avatar[:type]).to eq('avatar')

    expect(avatar).to have_key :attributes
    expect(avatar[:attributes].keys).to eq(%i[id name weapons profession])

    expect(avatar[:attributes][:id]).to be_a String
    expect(avatar[:attributes][:name]).to be_a String
    expect(avatar[:attributes][:weapons]).to be_a String
    expect(avatar[:attributes][:profession]).to be_a String
  end
end