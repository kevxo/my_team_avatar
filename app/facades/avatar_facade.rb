class AvatarFacade
  def self.all_avatars
    data = AvatarService.all_avatars

    data.map do |avatar_data|
      Avatar.new(avatar_data)
    end
  end

  def self.avatar(avatar_id)
    data = AvatarService.avatar(avatar_id)

    Avatar.new(data)
  end
end