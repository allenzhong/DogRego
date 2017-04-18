Given(/^I'm an registered user$/) do
  @user = User.create!({
  	username: 'admin',
    email: 'admin@admin.com',
    password: '12345678',
    password_confirmation: '12345678'
  })
  @user.save!
end

Given(/^I'm on login page$/) do
	visit new_user_session_path
end

When(/^I fill up  username and password$/) do
  fill_in 'user_login', with: @user.username
  fill_in 'user_password', with: '12345678'
end

When(/^Click 'Log in' button$/) do
	click_button 'Log in'
end

Then(/^The page should give notification "([^"]*)"$/) do |notification|
	expect(page).to have_content(notification)
end

