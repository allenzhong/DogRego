Given(/^I'm an registered owner$/) do
  @user = User.create!({
    username: 'admin',
    email: 'admin@admin.com',
    password: '12345678',
    password_confirmation: '12345678'
  })
  @user.save!
end

Given(/^I have login on$/) do
  visit new_user_session_path
  fill_in 'user_login', with: @user.username
  fill_in 'user_password', with: '12345678'
  click_button 'Log in'
  expect(page).to have_content("Signed")
end

Given(/^I'm on profile page$/) do
  visit edit_user_registration_path
end

When(/^I fill up my first name, middle name and last name with "([^"]*)", "([^"]*)" and "([^"]*)"$/) do |first, middle, last|
  fill_in 'user_profile_attributes_first_name', with: first 
  fill_in 'user_profile_attributes_middle_name', with: middle 
  fill_in 'user_profile_attributes_last_name', with: last 
end

When(/^I fill up my postal address$/) do
  fill_in 'user_profile_attributes_street', with: 'street'
  fill_in 'user_profile_attributes_town_city', with: 'city'
  fill_in 'user_profile_attributes_postcode', with: '1010'
  fill_in 'user_profile_attributes_country', with: 'NZ'
end

When(/^Click 'Update'$/) do
  fill_in 'user_current_password', with: '12345678'
  click_button "Update"
end

Then(/^The page should give me notification "([^"]*)"$/) do |save|
  expect(page).to have_content(save)
end

When(/^Click "([^"]*)" to deregister$/) do |deregister|
  click_button deregister
end

When(/^Click "([^"]*)"$/) do |arg1|
  wait = Selenium::WebDriver::Wait.new ignore: Selenium::WebDriver::Error::NoAlertPresentError
  alert = wait.until { page.driver.browser.switch_to.alert  }
  alert.accept
end

Then(/^The page should redirect to login page$/) do
  expect(page).to have_content("Sign in") 
end
