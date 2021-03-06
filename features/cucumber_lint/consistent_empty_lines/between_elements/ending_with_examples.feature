Feature: consistent_empty_lines between elements (ending with examples)

  Background:
    Given I have a feature with content
      """
      Feature: Test Feature

        Scenario Outline: Test Scenario Outline
          Given <a>
          Then <b>

          Examples:
            | a    | b    |
            | this | that |
        Scenario: Test Scenario
          Given this
          Then that
      """

  Scenario: disabled
    Given I have "consistent_empty_lines" disabled
    When I run `cucumber_lint`
    Then it passes

  Scenario: lint and fix
    Given I have "consistent_empty_lines" enabled with
      | KEY              | VALUE |
      | between_elements | 1     |
    When I run `cucumber_lint`
    Then it fails with
      | LINE | MESSAGE        |
      | 10   | Add empty line |
    When I run `cucumber_lint --fix`
    Then my feature now has content
      """
      Feature: Test Feature

        Scenario Outline: Test Scenario Outline
          Given <a>
          Then <b>

          Examples:
            | a    | b    |
            | this | that |

        Scenario: Test Scenario
          Given this
          Then that
      """
    When I run `cucumber_lint`
    Then it passes
