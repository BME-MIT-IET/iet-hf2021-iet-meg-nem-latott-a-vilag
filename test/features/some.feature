Feature: Monday isn't Friday

    Everybody wants to know when it's Friday

    Scenario: Monday isn't Friday
    Given today is Monday
    When I ask wether it's Friday yet
    Then I should be told "Friday"