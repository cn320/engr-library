Feature: I can return a book

  As an administrator

  I want to return a book

  And check charge price in case of overdue

Scenario: Return a book

  Given I am on the borrowreturnpage

  Then I should see "Main page"

  When I press a "Remove"

  Then I should not see "JAVA"
