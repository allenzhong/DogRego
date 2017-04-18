Feature: Register new user
As a new user
I want to register website with username, email
so that I can login later

Background:
	Given I'm an unregistered user
	
Scenario: Registeration
	When I fill up my username, email and password with corrected format
	And Click submit button
	Then The page should give notification 'You have signed up successfully' 
