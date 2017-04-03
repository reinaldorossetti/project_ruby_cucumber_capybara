@login_logout
Feature: Login and Logout.

  # As a new user and already registered
  # I want to log into my account
  # To access the RD Station.

  Scenario Outline: Login

    Given I am on RD Station login page "https://app.rdstation.com.br/login".
      When testable outcome Fill in the email field "<Login_type>".
      And Fill in the field password.
      And Select Ok button.
     Then Validate user access.
      And To do the logout.
     Then Validate the logout successfully performed.
     
    Examples:
      | Login_type        | 
      | Pessoa Fisica     | 
      | Pessoa Juridica   | 
