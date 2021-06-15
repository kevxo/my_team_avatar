require 'rails_helper'

RSpec.describe Search, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:request) }
    it { should validate_presence_of(:action) }
    it { should validate_uniqueness_of(:request).scoped_to(%i[action params payload]) }
  end
end
