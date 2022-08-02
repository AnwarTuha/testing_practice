Feature: users registration
  Scenario Outline: User should successfully register
    Given  User is on registration page
    And  User fill the required information:
      | first_name   | Middle_name   | Last_name   | Phone_number   | Email   | Password   |
      | <first_name> | <Middle_name> | <Last_name> | <Phone_number> | <Email> | <Password> |

    When The user taps on "Register" button
    Then The user should successfully register
    Examples:
      | first_name  | Middle_name  | Last_name   | Phone_number  | Email             | Password  |
      | 'testUser1' | 'testUser1'  | 'testUser1' | '0925252525'  | 'test1@gmail.com' | '1234567' |
      | 'testUser1' | 'testUser1'  | 'testUser1' | '0925252525'  | 'test2@gmail.com' | '1234567' |


  Scenario Outline: User registration failed
    Given  user is on registration page
    And  user fill the required information:
      | first_name   | Middle_name   | Last_name   | Phone_number   | Email   | Password   |
      | <first_name> | <Middle_name> | <Last_name> | <Phone_number> | <Email> | <Password> |
    When the user submit the user registration_form
    Then the system should display error <message>
    Examples:
      | first_name   | Middle_name   | Last_name   | Phone_number   | Email             | Password   | message                    |
      |              | 'testUser1'   | 'testUser1' | '0925252525'   | 'test1.com'       | '1234567'  | 'First name is required'   |
      | 'testUser1'  |               | 'testUser1' | '0925252525'   | 'test2@gmail.com' | '1234567'  | 'Middle name is required'  |
      | 'testUser1'  | 'testUser1'   | 'testUser1' |                | 'test1@gmail.com' | '1234567'  | 'Phone number is required' |
      | 'testUser1'  | 'testUser1'   |             | '0925252525'   | 'test1@gmail.com' | '1234567'  | 'Last name is required'    |
      | 'testUser1'  | 'testUser1'   | 'testUser1' | '0925252525'   |                   | '1234567'  | 'Email is required'        |
      | 'testUser1'  | 'testUser1'   | 'testUser1' | '0925252525'   | 'test1@gmail.com' |            | 'Password is required'     |
      | 'testUser1'  | 'testUser1'   | 'testUser1' | '0925252525'   | 'test1gmail.com'  | '1234567'  | 'Invalid email'            |
      | 'testUser1'  | 'testUser1'   | 'testUser1' | '0925252525'   | 'test1@gmail.com' | '12'       | 'Password to short'        |
      | 'testUser1'  | 'testUser1'   | 'testUser1' | '52525'        | 'test1@gmail.com' | '1234567'  | 'Invalid phone number'     |
