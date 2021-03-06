require 'rails_helper'

RSpec.describe Dog, type: :model do
  context "Association" do
    it "Belongs to a user" do
      should belong_to(:user)
    end
  end

  context 'CRUD' do
    it 'could be create' do
      dog = FactoryGirl.create(:dog)
      expect(dog).to be_valid
    end

    it 'could be updated' do
      dog = FactoryGirl.create(:dog)
      dog.name = "New Name"
      dog.save

      expect("New Name").to eq(dog.name)
    end

    it 'could be deleted' do
      dog = FactoryGirl.create(:dog)
      dog.save
      count = Dog.count
      dog.destroy
      expect(count - 1).to eq(Dog.count)
    end

    it 'could be found' do
      dog = FactoryGirl.create(:dog)
      dog.save
      expect(1).to eq(Dog.count)
    end
  end 

  context 'methods' do
    before(:each) do
      @ownership_registration = FactoryGirl.create(:ownership_registration)
      @dog = @ownership_registration.dog
    end

    it 'sends an email' do
      expect {
        @dog.send_ownership_registeration
      }.to have_enqueued_job.on_queue('mailers')
    end
  end
end
