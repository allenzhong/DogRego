Feature: Dogs CRUD
As a owner,
I want to look at dogs' details
so that I can manage them.


Background: 
	Given I'm an registered owner
	Given I have log on
	Given I'm on dogs page

# Scenario: Create a new dog
# 	When I click 'Register Dog'
# 	And Fill up form
# 	And Click 'Register'
# 	Then The page should give me notification "Your dog regsitered"

Scenario: Update details of dog
	When I select first dog and enter its details
	And Fill up form with new name
	Then The page should give me notification "Your dog's details updated"
	
@javascript
Scenario: deregister details of dog
	When I select first dog and enter its details
	And click "Deregister" and click "OK" for alert
	Then The page should give me notification "Your dog's have been deregistered"
