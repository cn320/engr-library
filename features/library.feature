Feature : Add new book to book categories
 

  As an administrator
  So that I can add a book to book categories
  I want to add new book  


Scenario: add new book to book categories
	Given I am on the “AddNewBookPage ”
	
	When I fill “ Ruby Tutor ” in book name box 
	
	And I fill “ RB1905 ” in book code box 
	
	And I fill “ 089153198 ” in barcode bo
	
	And I press “Done”

	Then I should see dialog “success full”

	And I should be on the “AddNewBookPage”

 

