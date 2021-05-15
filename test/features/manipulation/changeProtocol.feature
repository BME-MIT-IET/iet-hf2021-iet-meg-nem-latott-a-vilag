@manipulation @protocol
Feature: Change Protocol
    
    With the library you can change the protocol of the url

    Scenario: Change http protocol to https
    Given an url "http://example.com/"
    When I change the protocol to "https"
    Then the url will be "https://example.com/"