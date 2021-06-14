require 'rails_helper'

describe AvatarTeam do
  it 'exists' do
    name = 'Team Goat'
    avatar_data = {
      _id: '1',
      name: 'Roku',
      weapon: 'The elements',
      profession: 'Protector of all nations'
    }

    avatar = Avatar.new(avatar_data)

    team_data1 = {
      _id: '1',
      name: 'Kevin Cuadros',
      position: 'Leader',
      weapon: 'Fire',
      profession: 'Security Guard'
    }

    team_data2 = {
      _id: '2',
      name: 'Kevin Cuadros',
      position: 'Leader',
      weapon: 'Water',
      profession: 'Security Guard'
    }

    team_data3 = {
      _id: '3',
      name: 'Kevin Cuadros',
      position: 'Leader',
      weapon: 'Earth',
      profession: 'Security Guard'
    }

    mates = [team_data1, team_data2, team_data3]

    team = mates.map do |mate_data|
      TeamMate.new(mate_data)
    end

    avatar_team = AvatarTeam.new(name, avatar, team)

    expect(avatar_team).to be_a AvatarTeam
    expect(avatar_team.team_name).to eq('Team Goat')
    expect(avatar_team.avatar).to be_a Avatar
    expect(avatar_team.team).to be_a Array
    expect(avatar_team.team.first).to be_a TeamMate
  end
end