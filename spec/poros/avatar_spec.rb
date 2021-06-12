require 'rails_helper'

describe Avatar do
  it 'exists' do
    data = {
      _id: '1',
      name: 'Roku',
      weapon: 'The elements',
      profession: 'Protector of all nations'
    }

    avatar = Avatar.new(data)

    expect(avatar).to be_a Avatar
    expect(avatar.id).to eq('1')
    expect(avatar.name).to eq('Roku')
    expect(avatar.weapons).to eq('The elements')
    expect(avatar.profession).to eq('Protector of all nations')
  end
end
