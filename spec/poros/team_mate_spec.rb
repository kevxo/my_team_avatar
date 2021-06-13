require 'rails_helper'

describe TeamMate do
  it 'exists' do
    data = {
      _id: '1',
      name: 'Kevin Cuadros',
      position: 'Leader',
      weapon: 'Fire',
      profession: 'Security Guard'
    }

    team_mate = TeamMate.new(data)

    expect(team_mate).to be_a TeamMate
    expect(team_mate.id).to eq('1')
    expect(team_mate.name).to eq('Kevin Cuadros')
    expect(team_mate.position).to eq('Leader')
    expect(team_mate.weapons).to eq('Fire')
    expect(team_mate.profession).to eq('Security Guard')
  end
end