class TeamMateFacade
  def self.team_mates(count)
    mates = TeamMateService.my_mates(count)

    mates.map do |mate_data|
      TeamMate.new(mate_data)
    end
  end
end