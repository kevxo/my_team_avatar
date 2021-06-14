require 'rails_helper'

describe AvatarTeamFacade do
  it 'should return a Avatar Team object', :vcr do
    name = 'Avatar Team'
    count = 6

    avatar_team = AvatarTeamFacade.team(count, name)

    expect(avatar_team).to be_a AvatarTeam
    expect(avatar_team.team_name).to be_a String
    expect(avatar_team.avatar).to be_a Avatar
    expect(avatar_team.team).to be_a Array
  end
end