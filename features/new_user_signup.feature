Feature: New user signing up
  In order to give users confidence 
  As an unregistered user
  I want to sign up for an account

  Scenario: Signing up as an unregistered user
    When I go to the home page
    And I follow "Sign up"

    Then I should be on the new user registration page
    When I fill in "Email" with "user@example.com"
     And I fill in "Password" with "password"
     And I fill in "Password confirmation" with "password"
     And I press "Sign up"

    Then I should be on the new user session page
     And I should see "a confirmation was sent to your e-mail"

     And "user@example.com" should receive an email with subject "Confirmation instructions"
    When "user@example.com" opens the email with subject "Confirmation instructions"
     And I click the first link in the email

    Then I should be on the home page
     And I should see "Your account was successfully confirmed."
