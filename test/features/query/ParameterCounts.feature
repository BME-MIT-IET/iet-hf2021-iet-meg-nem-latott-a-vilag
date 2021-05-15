@query
Feature: Get the count of parameters

    You can get how many parameters the url has

    Scenario Outline: Get the count of parameters
        Given an url "<url>"
        And the url has the following parameters: "<parameters>"
        When I ask the the count of parameters
        Then It'll be "<count>"

    Examples:
        | url                   | parameters    | count |
        | http://example.com    | a, b, c, d    | 4     |
        | http://example.com    | a, b          | 2     |

    Scenario Outline: Ask wether the url has parameters
    Given an url "<url>"
    When I ask wether it has parameters 
    Then the answer will be "<answer>"

    Examples:
        | url                           | answer    |
        | http://example.com/           | No        |
        | http://example.com?foo=bar    | Yes       |
