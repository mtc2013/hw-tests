Feature: Testing instructor created homeworks
  In order to check that the supplied homework can be graded by AutoGrader
  As a AutoGrader maintainer
  I would like these homeworks to be automatically tested on submit

  Scenario: The project is cloned from AV/rag repo and installed
    Given the AutoGrader is cloned and gems are installed
    When I run cucumber for AutoGrader
    And I should see the execution results
    Then I should see that there are no errors

  Scenario Outline: Runs AutoGrader with a given spec sheet
    Given I have the homework in "hw/ruby-intro"
    When I run AutoGrader for <test_subject> and <spec>
    Then I should see that the results are <expected_result>
    And I should see the execution results with <test_title>
  Examples:
  | test_title         | test_subject           | spec                     | expected_result       |
  | specs vs solution  | solutions/lib/part1.rb | autograder/part1_spec.rb | Score out of 100: 100 |
  | specs vs skeleton  | public/lib/part1.rb    | autograder/part1_spec.rb | Score out of 100: 5   |
#|sanity_specs?
  Scenario: Runs AutoGrader with a given ruby framework hook
    Given I have the homework hook in "hw/ruby-intro"
    When I run the autograder for each mapping
    Then the results for each mapping match the expected values




#  Scenario: confirms AutoGrader feedback we could use for students
#    Given I delete all the autograder log files
#    And I run cucumber in "rag"
#    Then I should see a log directory "assign-0-part-1-submissions" has 8 files

#  Scenario: Checks that the supplied files are of correct format
#
#  Scenario: AutoGrader run results are visible in Travis
#
#  Scenario: AutoGrader runs test grading process for all homeworks in the repo
