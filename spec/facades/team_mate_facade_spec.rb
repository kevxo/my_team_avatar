require 'rails_helper'

describe TeamMateFacade do
  it 'returns a list of team mate objects', :vcr do
    count = 4
    mates = TeamMateFacade.team_mates(count)

    expect(mates).to be_a Array
    expect(mates.length).to eq(3)

    mates.each do |mate|
      expect(mate).to be_a TeamMate

      expect(mate.id).to be_a String
      expect(mate.name).to be_a String
      expect(mate.position).to be_a String unless mate.position.nil?
      expect(mate.weapons).to be_a String unless mate.weapons.nil?
      expect(mate.profession).to be_a String unless mate.profession.nil?
    end
  end
end