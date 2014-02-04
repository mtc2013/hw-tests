Feature: Testing instructor created homeworks
  In order to check that the supplied homework can be graded by AutoGrader
  As a AutoGrader maintainer
  I would like these homeworks to be automatically tested on submit

  Scenario: Runs an AutoGrader grading process on supplied homework
    Given I have AutoGrader setup
    And I have a homework "ruby-intro" in the repo
    When I run the AutoGrader on this homework
    Then I should see no runtime errors
    And I should see that the process succeeded


  Scenario: Checks the homeworks file structure

  Scenario: Checks that all necessary files are present

  Scenario: Checks that the supplied files are of correct format

  Scenario: AutoGrader run results are visible in Travis

  Scenario: AutoGrader runs test grading process for all homeworks in the repo
