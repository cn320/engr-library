Feature: Delete a book list

  As an admin
  So that I can delete a book list and update a book list in library
  I want to delete a book list from library database

Scenario: Try to delete a book list

  Given I am on the DeleteBookPage

  When I fill in "bookname" with "OOP"

  And I fill in "bookid" with "TK1965"
 
  And I fill in "bookbarcode" with "123678990"

  And I press "search"

  Then I should see "Listing Books"

  When I press a "Remove"

  Then I should be a on the book details page 
