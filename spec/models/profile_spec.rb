require 'rails_helper'

RSpec.describe Profile, type: :model do
	context 'Association' do
		it 'belongs to an user' do
			should belong_to(:user)
		end
	end
	
  context 'CRUD' do
    it 'could be create' do
      profile = FactoryGirl.create(:profile)
      expect(profile).to be_valid
    end

    it 'could be updated' do
    	profile = FactoryGirl.create(:profile)
    	profile.street = "New Profile"
    	profile.suburb = "New Suburb"
    	profile.town_city = "New City"
    	profile.postcode = "1025"
    	profile.save

    	expect("New Profile").to eq(Profile.first.street)
    	expect("New Suburb").to eq(Profile.first.suburb)
    	expect("New City").to eq(Profile.first.town_city)
    	expect("1025").to eq(Profile.first.postcode)
    end

    it 'could be deleted' do
      profile = FactoryGirl.create(:profile)
      profile.save
      count = Profile.count
      profile.destroy
      expect(count - 1).to eq(Profile.count)
    end

    it 'could be found' do
      profile = FactoryGirl.create(:profile)
      profile.save
      expect(1).to eq(Profile.count)
    end
  end
end
