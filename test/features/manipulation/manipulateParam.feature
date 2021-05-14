Feature: Manipulate url
    You can add, remove or change parameters of the url
    
    Scenario: Add parameter
    Given an url "http://example.com/"
    When I add a parameter "param" with the value "9"
    Then the url will have a parameter with name "param" and value "9"
    
    Scenario: Delete parameter
    Given an url "http://example.com/"
    And it has a parameter "param" with value "9"
    When I delete the parameter "param"
    Then the url won't have the parameter "param"

    Scenario Outline: Change parameter
    Given an url "<url>"
    And it has a parameter "<parameter>" with value "<value>"
    When I change the value of "<parameter>" to "<new-value>"
    Then the value of "<parameter>" will be "<new-value>" 

    Examples:
        | url                           | parameter | value     | new-value |
        | http://example.com/           | paramName | 9         | xy        |
        | https://google.com/path?a=b   | b         | c         | 3         |
        | /x/y                          | z         | someValue | new Value |

    Scenario: Clear all parameters
    Given an url "http://example.com?a=b&b=c&d=3"
    When I clear all the parameters
    Then the url will be "http://example.com/"