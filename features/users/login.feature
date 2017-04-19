Feature: login
As a registered user
I want to login website with username or email
so that I do further operation

Background:
	Given I'm an registered user
	Given I'm on login page

Scenario: login with username 
	When I fill up  username and password 
	And Click 'Log in' button
	Then The page should give notification "Signed in successfully"

