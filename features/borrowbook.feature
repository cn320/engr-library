Feature: Admin can do detail to borrowing book of student

Scenario: Try to make detail to borrow book of student

  Given I am on the borrow page

  Then I should see "Main page"

  When I fill in "bid" with "R12345"

  And I press a "Borrow"

  Then I should see JAVA

