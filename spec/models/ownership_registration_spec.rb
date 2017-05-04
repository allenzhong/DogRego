require 'rails_helper'

RSpec.describe OwnershipRegistration, type: :model do
	context "Association" do
		it "Belongs to a dog" do
			should belong_to(:dog)
		end
	end

	context 'CRUD' do
		it 'could be created' do
			registration = FactoryGirl.create(:ownership_registration)
			expect(registration).to be_valid
		end

		it 'could be updated' do
			registration = FactoryGirl.create(:ownership_registration)
    	registration.duration = "twelve_months"
    	registration.save
    	expect("twelve_months").to eq(registration.duration)
    end

    it 'could be deleted' do
			registration = FactoryGirl.create(:ownership_registration)
      count = OwnershipRegistration.count
      registration.destroy
      expect(count - 1).to eq(OwnershipRegistration.count)
    end

    it 'could be found' do
			registration = FactoryGirl.create(:ownership_registration)
      expect(1).to eq(OwnershipRegistration.count)
    end
	end
end
