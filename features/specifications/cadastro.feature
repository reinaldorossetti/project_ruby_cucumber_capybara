@cadastro
Feature: User Registration.

As an unregistered user
   want to create a registration in RD Station
   To be able to access the features.

  Scenario Outline:: New Register.

    Given I am on RD Station registration page "https://app.rdstation.com.br/cadastro".
       When Fill in the information of the Account and Login "<Login_type>".
       And Fill in the information of the Contracting Authority.
       And Send the completed register.
      Then Validate user access with message "<message>".

    Examples:
      | Login_type   | message          |
      | 0            | Seja bem-vindo!  |
      | 1            | Seja bem-vindo!  |
