@login_logout
Feature: Login and Logout.

  # As a new user and already registered
  # I want to log into my account
  # To access the RD Station.

  Background: Login

    Given I am on RD Station login page "https://app.rdstation.com.br/login".
      When testable outcome Fill in the email field.
      And Fill in the field password.
      And Select Ok button.
     Then Validate user access.

   # As logged in user
   # I want to log out of my account

  @logout
  Scenario: Logout

    When To do the logout.
    Then Validate the logout successfully performed.
