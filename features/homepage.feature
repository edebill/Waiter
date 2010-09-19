Feature: App name in header
  In order to brand my application
  As a web browser
  I want my test to check for Waiter

  Scenario: Viewing the page

    Given I am on the home page
    Then I should see "Waiter"
    And I should see "Sign Up"
    And I should see "Sign In"


