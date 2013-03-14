Feature: Admin can Change a Charge Price or Checkout Allow For Each Category User

  As an admin
  So that I can change a price charge for each category user
  I want to edit a price charge or checkout allow then update those object

Scenario: Try to change a price charge or checkout allow

  Given I am on the ChargePrice page

  Then I should see "Change New Values"

  When I fill in "bac1" with "100"

  And I press "Update Info"

  Then I am exists the ChargePrice page

