Feature: Admin can Change a Charge Price or Checkout Allow For Each Category User

  As an admin
  So that I can change a price charge for each category user
  I want to edit a price charge or checkout allow then update those object

Scenario: Try to change a price charge or checkout allow

  Given I am on the ChargePrice page

  Then I should see "Change New Values"

  When I fill in "Bachelor’s Degree row" and "price" with "5"

  And I press "update"

  Then I should be on the ChargePrice page

  And I should see "Bachelor’s Degree row" and "Price Charge column" update to "5"
