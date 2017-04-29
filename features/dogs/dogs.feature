Feature: Dogs CRUD
As a owner,
I want to look at dogs' details
so that I can manage them.


Background: 
	Given I'm an registered owner
	Given I have log on
	Given I'm on dogs page

Scenario: Create a new dog
	When I click 'New Dog'
	And Fill up form
	And Click 'Save' to save
	Then The page should be redirected to show detail

Scenario: Update details of dog
	When I select first dog and enter its details
	And Fill up form with new name
	And Click 'Update' for update
	Then The page should notify me "Your dog's details updated"
	
@javascript
Scenario: Delete dog
	When I select first dog and click "Delete" to delete
	And Click "Ok" for alert
	Then The page should be redirected to index page
