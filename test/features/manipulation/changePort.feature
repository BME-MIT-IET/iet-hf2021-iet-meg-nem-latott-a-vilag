@manipulation @port
Feature: Change Port

    You can change the port of the url

    Scenario Outline: Change Port
    Given an url "<url>"
    When I set the port to "<port-number>"
    Then the url will be "<expected-url>"

    Examples:
        | url                       | port-number           | expected-url             |
        | http://example.com:5000   | 8080                  | http://example.com:8080/ |
        | http://example.com        | 5000                  | http://example.com:5000/ |
    
