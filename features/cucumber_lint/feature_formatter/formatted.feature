Feature: feature formatter

  Scenario: formatted
    Given feature content
      """
      Feature: Test Feature

        Scenario: Test Scenario
          Given A
          And B
          When C
          Then D
          And E

        Scenario: Test Scenario
          Given a table
            | header_column1 | header_column2 |
            | row1_column1   | row1_column2   |
            | row2_column1   | row2_column2   |
            | row3_column1   | row3_column2   |
          Then my tests pass

        Scenario Outline: Test Scenario Outline
          Given <a> and <b>
          Then I expect <c>

          Examples:
            | a  | b  | c  |
            | a1 | b1 | c1 |
            | a2 | b2 | c2 |
            | a3 | b3 | c3 |
      """
    Then the feature is formatted