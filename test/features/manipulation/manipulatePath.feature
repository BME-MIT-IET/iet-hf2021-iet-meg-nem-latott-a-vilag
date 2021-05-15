@manipulation @path
Feature: Manipulate path

    We can change the path of the url

Scenario Outline: Declare path
Given an url "<url>"
When i change the path of url to "<path-elements>"
Then the url will be "<expected-url>"

Examples:
    | url                               | path-elements             | expected-url                          |
    | http://example.com                | a, b, c                   | http://example.com/a/b/c              |
    | http://example.com/path1/path2    | doc, report, bdd          | http://example.com/doc/report/bdd     |


