class TeamMateSerializer
  include FastJsonapi::ObjectSerializer

  set_id { nil }
  attributes :id, :name, :position, :weapons, :profession
end
