@encode
Feature: Encode url part

    Performs URI-compatible encoding of the given urlPart component

    Scenario Outline: Encode url part
    Given an url part "<url-part>"
    When I encode the url part
    Then the url part will be "<encoded-url-part>"

    Examples:
        | url-part               | encoded-url-part               |
        | ?a=3                   | %3Fa%3D3                       |
        | path?a=8&g=\"sdok\"    | path%3Fa%3D8%26g%3D%22sdok%22  |
        | password=\"okdasp\"    | password%3D%22okdasp%22        |