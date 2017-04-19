require 'rails_helper'

RSpec.describe Address, type: :model do
	context 'Association' do
		it 'belongs to an user' do
			should belong_to(:user)
		end
	end
	
  context 'CRUD' do
    it 'could be create' do
      address = FactoryGirl.create(:address)
      expect(address).to be_valid
    end

    it 'could be updated' do
    	address = FactoryGirl.create(:address)
    	address.street = "New Address"
    	address.suburb = "New Suburb"
    	address.town_city = "New City"
    	address.postcode = "1025"
    	address.save

    	expect("New Address").to eq(Address.first.street)
    	expect("New Suburb").to eq(Address.first.suburb)
    	expect("New City").to eq(Address.first.town_city)
    	expect("1025").to eq(Address.first.postcode)
    end

    it 'could be deleted' do
      address = FactoryGirl.create(:address)
      address.save
      count = Address.count
      address.destroy
      expect(count - 1).to eq(Address.count)
    end

    it 'could be found' do
      address = FactoryGirl.create(:address)
      address.save
      expect(1).to eq(Address.count)
    end
  end
end
