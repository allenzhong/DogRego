require 'rails_helper'

RSpec.describe "Users::Registrations", type: :request do
  describe "GET /users/sign_up" do
    it "display sign up page" do
      get new_user_registration_path
      expect(response).to have_http_status(200)

      assert_select "form#new_user" do
        assert_select "input[name=?]", "user[username]"
        assert_select "input[name=?]", "user[email]"
        assert_select "input[name=?]", "user[profile_attributes][first_name]"
        assert_select "input[name=?]", "user[profile_attributes][middle_name]"
        assert_select "input[name=?]", "user[profile_attributes][last_name]"
        assert_select "input[name=?]", "user[profile_attributes][street]"
        assert_select "input[name=?]", "user[profile_attributes][suburb]"
        assert_select "input[name=?]", "user[profile_attributes][town_city]"
        assert_select "input[name=?]", "user[profile_attributes][country]"
        assert_select "input[name=?]", "user[profile_attributes][postcode]"
        assert_select "input[name=?]", "user[password]"
        assert_select "input[name=?]", "user[password_confirmation]"
        assert_select "input[name=?]", "commit"
      end

      user = FactoryGirl.build(:user)
      profile = FactoryGirl.build(:profile)
      parameters = {
        username: user.username,
        email: user.email,
        password: user.password,
        password_confirmation: user.password_confirmation,
        profile_attributes: profile.attributes.to_h 
      }
      post "/users", params: { user: parameters } 
      assert_response :redirect
      follow_redirect!
      assert_response :success
      assert_select ".page-header", text: "Dashboard" 
    end

    it "take page back when parameters are invalid" do
      user = FactoryGirl.build(:user)
      profile = FactoryGirl.build(:profile)
      parameters = {
        password: user.password,
        password_confirmation: user.password_confirmation,
      }
      expect {
        post "/users", params: { user: parameters } 
      }.to_not change(User, :count)

    end
  end
end
