@decode
Feature: Decode url part

    Performs URI-compatible decoding of the given urlPart component

    Scenario Outline: Decode url part
    Given an encoded url part "<encoded-url-part>"
    When I decode the url part
    Then the decoded url part will be "<decoded-url-part>"

    Examples:
        | decoded-url-part       | encoded-url-part               |
        | ?a=3                   | %3Fa%3D3                       |
        | path?a=8&g=\"sdok\"    | path%3Fa%3D8%26g%3D%22sdok%22  |
        | password=\"okdasp\"    | password%3D%22okdasp%22        |