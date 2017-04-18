Given(/^I'm an unregistered user$/) do
  visit new_user_registration_path
end

When(/^I fill up my username, email and password with corrected format$/) do
	fill_in 'user_username', with: "leo"
	fill_in 'user_email', with: 'leo@gmail.com'
	fill_in 'user_password', with: '11111111'
	fill_in 'user_password_confirmation', with: '11111111'
end

When(/^Click submit button$/) do
	click_button 'Sign up'
end

Then(/^The page should give notification 'You have signed up successfully'$/) do
	expect(page).to have_content('You have signed up successfully')
end
