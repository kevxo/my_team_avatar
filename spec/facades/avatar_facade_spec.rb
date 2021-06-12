require 'rails_helper'

describe AvatarFacade do
  it 'returns a list of avatar objects', :vcr do
    facade = AvatarFacade.all_avatars

    expect(facade).to be_a Array
    expect(facade.first).to be_a Avatar

    expect(facade.first.id).to be_a String
    expect(facade.first.name).to be_a String
    expect(facade.first.weapons).to be_a String
    expect(facade.first.profession).to be_a String
  end
end