require 'rails_helper'

RSpec.describe "Dogs", type: :request do
  before(:each) do
    sign_in FactoryGirl.create(:user)
  end	

  it "visit pages and render right templates" do
		get dogs_path
		expect(response).to render_template(:index)
	end

	it "create a Dog and redirect to show page" do
		get new_dog_path
		expect(response).to render_template(:new)

		post dogs_path, params: {:dog=>FactoryGirl.build(:dog).attributes} 
		expect(response).to redirect_to(assigns(:dog))
		follow_redirect!

		expect(response).to render_template(:show)
	end

	it "update a Dog and redirect to show page" do
		dog = FactoryGirl.create(:dog)

		get edit_dog_path(dog.id)
		expect(response).to render_template(:edit)

		patch dog_path(dog.id), params: {:dog=>FactoryGirl.build(:dog).attributes} 
		expect(response).to redirect_to(assigns(:dog))
		follow_redirect!

		expect(response).to render_template(:show)
	end

	it "delete a dog and redirect to index page" do
		dog = FactoryGirl.create(:dog)
		expect(1).to eq(Dog.count) 

		expect {
			delete dog_path(dog)
		}.to change(Dog, :count).by(-1)
	end
end
