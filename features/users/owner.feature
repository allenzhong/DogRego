Feature: Owner
As a owner,
I want to visit my profile
so that I can enter, save, update or delete my details

Background:
	Given I'm an owner
	Given I have login on
	Given I'm on profile page

Scenario: Enter/Update owner's detail
	When I fill up my first name, middle name and last name with "Sathish", "Prabhu" and "Vijaya Kumar"
	When I fill up my postal address
	And Click 'Update'
	Then The page should give me notification "Your account has been updated successfully"

@javascript
Scenario: deregister owner
	When Click "Deregistration" to deregister
	And Click "OK"
	Then The page should redirect to login page 
