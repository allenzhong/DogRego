Feature: Admin
As a admin
I want to browse report 
so that I can see users' dogs and ownership registrations

Background:
	Given There are two dogs 
	Given 
	Given I'm an admin

Scenario: browse report 
	When I fill up username and password 
	And Click 'Log in' button
	Then The page should display one user and dogs' information
