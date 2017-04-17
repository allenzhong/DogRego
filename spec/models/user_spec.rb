require 'rails_helper'

RSpec.describe User, type: :model do
  context 'CRUD' do
    it 'could be create' do
      user = FactoryGirl.create(:user)
      expect(user).to be_valid
    end
  end
end
