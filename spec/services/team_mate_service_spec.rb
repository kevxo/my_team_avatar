require 'rails_helper'

describe TeamMateService do
  it 'retrieve three team mates', :vcr do
    count = 8

    mates = TeamMateService.my_mates(count)
    expect(mates.length).to eq(3)

    mates.each do |mate|
      expect(mate).to be_a Hash

      expect(mate).to have_key :_id
      expect(mate[:_id]).to be_a String

      expect(mate).to have_key :name
      expect(mate[:name]).to be_a String
    end
  end
end