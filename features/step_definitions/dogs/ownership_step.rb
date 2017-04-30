Given(/^I have logged in$/) do
	@user = User.create!({
    username: 'admin1',
    email: 'admin1@admin.com',
    password: '12345678',
    password_confirmation: '12345678'
  })
  @user.save!
  visit new_user_session_path
  fill_in 'user_login', with: @user.username
  fill_in 'user_password', with: '12345678'
  click_button 'Log in'
  expect(page).to have_content("Signed")
end

Given(/^I have one dog created$/) do
	@dog = FactoryGirl.create(:dog)	
	visit dogs_path
end

When(/^I click 'Register' for my first dog$/) do
	within '.table' do
		first('a.btn-circle').click
	end
end

When(/^Select "([^"]*)" for registration$/) do |arg1|
	expect(page).to have_content("12 months")
	choose('12 months')
	click_on 'Register My Dog'
end

Then(/^The page should show confirmation$/) do
	expect(page).to have_content("is now registered for twelve months")
	# expect(page).to have_content("pay $85 to bank account 12-1234-1234-01")
end
