Feature: User accounts
  In order to keep other folks from seeing my data
  As a registered user
  I want to log in to my account

  Scenario: Signing in
    Given the following confirmed user exists:
      | Email            |
      | user@example.net |
    Given I am on the homepage
    When I follow "Sign In"
    And I fill in "Email" with "user@example.net"
    And I fill in "Password" with "password"
    When I press "Sign in"
    Then I should see "Signed in as"
