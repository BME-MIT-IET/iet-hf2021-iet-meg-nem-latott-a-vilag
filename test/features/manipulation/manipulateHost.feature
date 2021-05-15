@manipulation @host
Feature: Manipulate host

    The host can be set in the url

    Scenario: Add host
    Given an url "/doc/etc/a"
    When I set the host to "developer.mozilla.org"
    Then the url will be "file://developer.mozilla.org/doc/etc/a"