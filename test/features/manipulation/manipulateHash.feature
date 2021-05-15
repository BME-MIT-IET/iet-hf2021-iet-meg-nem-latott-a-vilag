@manipulation @hash
Feature: Manipulate Hash

    Anchor part of the URL. Everything after # and to the end of anchor

    Scenario: Add anchor
    Given an url "http://example.com"
    When I set the anchor "baz"
    Then the url will be "http://example.com/#baz"    

