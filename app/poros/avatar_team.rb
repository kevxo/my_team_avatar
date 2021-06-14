class AvatarTeam
  attr_reader :team_name, :avatar, :team

  def initialize(name, avatar, team)
    @team_name = name
    @avatar = avatar
    @team = team
  end
end
