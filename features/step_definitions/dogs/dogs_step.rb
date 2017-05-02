Given(/^I'm a dog owner$/) do
  @user = User.create!({
    username: 'admin1',
    email: 'admin1@admin.com',
    password: '12345678',
    password_confirmation: '12345678'
  })
end

Given(/^I have logged on$/) do
  visit new_user_session_path
  fill_in 'user_login', with: @user.username
  fill_in 'user_password', with: '12345678'
  click_button 'Log in'
  expect(page).to have_content("Signed")
  @dog = Dog.create!({
    name: 'Citi',
    breed: 'Dog',
    date_of_birth_on: '14/04/2011',
    user: @user
  })
end

Given(/^I'm on dogs page$/) do
  visit dogs_path 
end

When(/^I click 'New Dog'$/) do
  click_link 'New Dog'
end

When(/^Fill up form$/) do
  @dog = FactoryGirl.build(:dog)
  fill_in 'dog_name', with: @dog.name
  fill_in 'dog_breed', with: @dog.breed
  fill_in 'dog_date_of_birth_on', with: @dog.date_of_birth_on
end

When(/^Click 'Save' to save$/) do
  click_on 'Save'
end

Then(/^The page should be redirected to show detail$/) do
  expect(page).to have_content(@dog.name)
  expect(page).to have_content(@dog.breed)
end

When(/^I select first dog and enter its details$/) do
  within ".table" do
    click_link "Show", match: :first
  end
  expect(page).to have_content(@dog.name)
end

When(/^Fill up form with new name$/) do
  visit edit_dog_path(@dog)
  fill_in 'dog_name', with: "NewName"
end

When(/^Click 'Update' for update$/) do
  click_on 'Update'
end

Then(/^The page should notify me "([^"]*)"$/) do |arg1|
  expect(page).to have_content(arg1)
end

When(/^I select first dog and click "([^"]*)" to delete$/) do |arg1|
  within ".table" do
    click_link "Delete", match: :first
  end
end

When(/^Click "([^"]*)" for alert$/) do |arg1|
  page.driver.browser.switch_to.alert.accept
end

Then(/^The page should be redirected to index page$/) do
  expect(page).to have_no_content(@dog.name)
end
