Feature: Recording biometric data
  In order to monitor my health
  As a registered user
  I want to record my weight, blood pressure and heart rate

  Scenario: Recording my weight
    Given the following confirmed user exists:
      | Email            |
      | user@example.net |

    When I am logged in as "user@example.net"
    When I fill in "biometric[record_date]" with "2010-06-01"
    And I fill in "biometric[weight]" with "123.4"
    And I press "Record"
    
    Then I should see "123.4"
    And I should get a notice containing "successfully recorded."
