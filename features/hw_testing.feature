Feature: Testing instructor created homeworks
  In order to check that the supplied homework can be graded by AutoGrader
  As a AutoGrader maintainer
  I would like these homeworks to be automatically tested on submit

  Scenario: The project is cloned from AV/rag repo and installed
    Given the AutoGrader is cloned and gems are installed
    When I run cucumber for AutoGrader
    And I should see the execution results
    Then I should see that there are no errors

  Scenario: Runs the AutoGrader on the homework
    Given I have the homework in "hw/ruby-intro"
    When I run AutoGrader with the following spec sheet:
      | test_subject           | spec                     |
      | solutions/lib/part1.rb | autograder/part1_spec.rb |
    Then I should see that there are no errors
    And I should see the execution results

  Scenario: Runs the AutoGrader against solution and expects correct results
    Given I have the homework in "hw/ruby-intro"
    When I run AutoGrader with the following spec sheet:
      | test_subject           | spec                     | expected_result             |
      | solutions/lib/part1.rb | autograder/part1_spec.rb | Score out of 100: 100       |
    Then I should see the expected result
    And I should see the execution results

  Scenario: Runs the AutoGrader against skeleton and expects less correct results
    Given I have the homework in "hw/ruby-intro"
    When I run AutoGrader with the following spec sheet:
      | test_subject           | spec                     | expected_result      |
      | public/lib/part1.rb    | autograder/part1_spec.rb | Score out of 100: 5  |
    Then I should see the expected result
    And I should see the execution results


#  Scenario: confirms AutoGrader setup
#    Given I delete all the autograder log files
#    And I run cucumber in "rag"
#    Then I should see a log directory "assign-0-part-1-submissions" has 8 files
#
#



#    Given that I am in the project root directory "hw-tests"
#    And that there is an autograders directory "rag"
#    And that there is a homeworks directory "hw"

#  Scenario: Checks the homeworks file structure
#    When I check each homeworks directory
#    Then I should see a directory "autograder" with at least one file
#    And I should see a directory "public" with at least one file
#    And I should see a directory "solutions" with at least one file
#    #And no empty directories or no loose files?
#
#  Scenario: Checks that all necessary files are present
#    When I check the autograders directory
#    Then I should see an autograder directory "spec" with unit tests
#    And I should see an autograder directory "features" with integration tests
#    And I should see an autograder directory "log" where logs are output
#
#
#
#  Scenario: Runs an AutoGrader grading process on supplied homework
#    Given I have a homework "ruby-intro"
#    And I run the AutoGrader on this homework
#    Then I should see the test results output
#    And I should see no runtime errors
#    And I should see that the process succeeded
#
#  Scenario: Checks that the supplied files are of correct format
#
#  Scenario: AutoGrader run results are visible in Travis
#
#  Scenario: AutoGrader runs test grading process for all homeworks in the repo
