@auth
Feature: Manipulate auth

    Auth user password and name can be added to url

    Scenario: Add password and name to url
    Given an url "http://example.com"
    When I add the user name "user1"
    When I add the password "abc123"
    Then the url will be "http://user1:abc123@example.com/"