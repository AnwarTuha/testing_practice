Feature: Main screen validates input and logs in
  Scenario: When email and password field are filled continue button is clicked
    Given I have "emailField" and "passField" and "loginButton"
    When I fill the "emailField" field with "anwartuha2@gmail.com"
    And I fill the "passField" field with "123456"
    Then I tap the "loginButton" button
    Then I should have "homePage" screen loaded