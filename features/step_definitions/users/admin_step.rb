Given(/^There are two dogs$/) do
	ownership1 = FactoryGirl.create(:ownership_registration)
	@dog1 = ownership1.dog
	@user1 = @dog1.user

	ownership2 = FactoryGirl.create(:ownership_registration)
	@dog2 = ownership2.dog
	@user2 = @dog2.user
end

Given(/^I'm an admin$/) do
  @admin = User.create!({
    username: 'admin',
    email: 'admin@admin.com',
    password: '12345678',
    password_confirmation: '12345678',
    roles: [:admin]
  })
  @admin.save!
end

When(/^I fill up username and password$/) do
	visit new_user_session_path
  fill_in 'user_login', with: @admin.username
  fill_in 'user_password', with: '12345678'
  click_button 'Log in'
  expect(page).to have_content("Signed")
end

Then(/^The page should display one user and dogs' information$/) do
	expect(page).to have_content(@dog1.name)
	expect(page).to have_content(@ownership1.duration.humanize.downcase)
	expect(page).to have_content(@dog2.name)
	expect(page).to have_content(@ownership2.duration.humanize.downcase)
end
