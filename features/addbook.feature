Feature: Add new book to book categories

  As an administrator
  So that I can add a book to book categories
  I want to add new book  


Scenario: add new book to book categories
	Given I am on the AddBookpage 
	
	When I fill in "bookname" with "Rubytutor"
	
	And I fill in "bookid" with "RB1905"  
	
	And I fill in "barcode" with "089153198" 
	
	And I press "create"

	Then I should see "The new book created successfully"

	And I should be on the Popup page

 

