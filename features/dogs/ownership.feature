Feature: Ownership registration
As a owner,
I want to choose different duration of ownership 
so that I can register my dog.

Background:
	Given I have logged in
	Given I have one dog created
	Given I'm on dogs page 

Scenario: 
	When I click 'Register' for my first dog
	And Select "12 months" for registration
	Then The page should show confirmation
