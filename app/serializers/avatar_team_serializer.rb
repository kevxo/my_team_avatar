class AvatarTeamSerializer
  include FastJsonapi::ObjectSerializer

  set_id { nil }
  attributes :team_name, :avatar, :team
end