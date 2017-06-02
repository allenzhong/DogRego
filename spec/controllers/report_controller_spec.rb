require 'rails_helper'

RSpec.describe ReportController, type: :controller do
  login_admin

  let(:user) { controller.current_user }
  let(:dog) { FactoryGirl.create(:dog)}
  let(:ownership_registration) {FactoryGirl.create(:ownership_registration)}

  describe "GET #index" do
    it "assigns all dogs as @dogs" do
      get :index
      expect(assigns(:users)).to eq([dog.user, ownership_registration.dog.user])
    end
  end
end
