class AvatarTeamFacade
  def self.team(count, name)
    count = 3 if count.nil?
    team_service = TeamMateService.my_mates(count)
    avatar_service = AvatarService.all_avatars.sample(1).first

    avatar = Avatar.new(avatar_service)
    team = team_service.map do |mate_data|
      TeamMate.new(mate_data)
    end

    AvatarTeam.new(name, avatar, team)
  end
end