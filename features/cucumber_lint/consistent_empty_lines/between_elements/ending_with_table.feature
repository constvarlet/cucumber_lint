Feature: consistent_empty_lines between elements (ending with table)

  Background:
    Given I have a feature with content
      """
      Feature: Test Feature

        Scenario: Test Scenario
          Given this
          Then that
            | table |
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
      | KEY      | VALUE |
      | elements | 1     |
    When I run `cucumber_lint`
    Then it fails with
      | LINE | MESSAGE        |
      | 7    | Add empty line |
    When I run `cucumber_lint --fix`
    Then my feature now has content
      """
      Feature: Test Feature

        Scenario: Test Scenario
          Given this
          Then that
            | table |

        Scenario: Test Scenario
          Given this
          Then that
      """
    When I run `cucumber_lint`
    Then it passes
