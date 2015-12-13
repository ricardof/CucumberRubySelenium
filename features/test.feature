Feature: As a user, I wish to generate a temporary email and use it

  Scenario: Generate temporary email and send email to self
    Given I generated a new email
    When I send a new email to self
    Then I can see the new email in the inbox
