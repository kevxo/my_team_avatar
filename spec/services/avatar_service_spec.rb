require 'rails_helper'

describe AvatarService do
  it 'returns all avatars data', :vcr do
    avatars  = AvatarService.all_avatars

    avatars.each do |avatar|
      expect(avatar).to be_a Hash

      expect(avatar).to have_key :_id
      expect(avatar[:_id]).to be_a String

      expect(avatar).to have_key :name
      expect(avatar[:name]).to be_a String

      expect(avatar).to have_key :weapon
      expect(avatar[:weapon]).to be_a String

      expect(avatar).to have_key :profession
      expect(avatar[:profession]).to be_a String
    end
  end
end