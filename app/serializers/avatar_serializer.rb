class AvatarSerializer
  include FastJsonapi::ObjectSerializer

  set_id { nil }
  attributes :id, :name, :weapons, :profession
end