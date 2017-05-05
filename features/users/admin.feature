Feature: Admin
As a admin
I want to browse report 
so that I can see users' dogs and ownership registrations

Background:
	Given There are two dogs 
	Given I'm an admin

Scenario: browse report 
	When I login with my username and password 
	Then The page should display one user and dogs' information
