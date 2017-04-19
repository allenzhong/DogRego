require 'rails_helper'

RSpec.describe User, type: :model do
	context 'Association' do
		it 'Has one postal profile' do
			should have_one(:profile)
		end
	end

  context 'CRUD' do
    it 'could be create' do
      user = FactoryGirl.create(:user)
      expect(user).to be_valid
    end

    it 'could be updated' do
    	user = FactoryGirl.create(:user)
    	user.username = "Test"
    	user.email = "test@test.com"
    	user.save

    	expect("Test").to eq(User.first.username)
    	expect("test@test.com").to eq(User.first.email)
    end

    it 'could be deleted' do
      user = FactoryGirl.create(:user)
      user.save
      count = User.count
      user.destroy
      expect(count - 1).to eq(User.count)
    end

    it 'could be found' do
      user = FactoryGirl.create(:user)
      user.save
      expect(1).to eq(User.count)
    end
  end
end
