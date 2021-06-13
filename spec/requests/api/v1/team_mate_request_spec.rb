require 'rails_helper'

describe 'Characters API' do
  it 'retrives random teammates', :vcr do
    count = 3

    get "/api/v1/team_mates?count=#{count}"

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    team_mates = json[:data]

    expect(team_mates.length).to eq(3)

    team_mates.each do |mate|
      expect(mate[:type]).to eq('team_mate')

      expect(mate).to have_key :attributes
      expect(mate[:attributes].keys).to eq(%i[id name position weapons profession])

      expect(mate[:attributes][:id]).to be_a String
      expect(mate[:attributes][:name]).to be_a String
      expect(mate[:attributes][:position]).to be_a String
      expect(mate[:attributes][:weapons]).to be_a String unless mate[:attributes][:weapons].nil?
      expect(mate[:attributes][:profession]).to be_a String unless mate[:attributes][:weapons].nil?
    end
  end

  it 'should return always 3 team mates', :vcr do
    count = 10

    get "/api/v1/team_mates?count=#{count}"

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    team_mates = json[:data]

    expect(team_mates.length).to_not eq(10)
    expect(team_mates.length).to eq(3)
  end
end
