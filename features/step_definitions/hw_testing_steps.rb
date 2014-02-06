require 'open3'

def run_ag(subject, spec)
  cli_string = "./grade ../#{subject} ../#{spec}"
  @test_output, @test_errors, @test_status = Open3.capture3(
      { 'BUNDLE_GEMFILE' => 'Gemfile' }, cli_string, :chdir => 'rag'
  )
end

## Given steps

Given(/^the AutoGrader is cloned and gems are installed$/) do
  expect(Dir).to exist('rag')
end

Given /I have the homework in "([^"]*)"/ do |path|
  @hw_path = path
end

## When steps

When /^I run cucumber for AutoGrader$/ do
  @test_output, @test_errors, @test_status = Open3.capture3(
      { 'BUNDLE_GEMFILE' => 'Gemfile' }, 'bundle exec cucumber', :chdir => 'rag'
  )
end

When(/^I run AutoGrader for (.*) and (.*)$/) do |test_subject, spec|
  run_ag("#{@hw_path}/#{test_subject}", "#{@hw_path}/#{spec}")
end

## Then steps

Then(/^I should see that the results are (.*)$/) do |expected_result|
  expect(@test_output).to match /#{expected_result}/
end

And(/^I should see the execution results with (.*)$/) do |test_title|
  success = @test_status.success? ? 'success' : 'failure'
  puts test_title + ': ' + success
  expect(success).to eq 'success'
end

Then(/^I should see that there are no errors$/) do
  expect(@test_status).to be_success
end

Then(/I should see the execution results$/) do
  puts @test_status
  puts @test_errors
  puts @test_output
end




#
#
#Given /^that I am in the project root directory "(.*?)"$/ do |project_dir|
#  @project_dir = project_dir
#  expect(File.basename(Dir.getwd)).to eq @project_dir
#end
#
#Given /^that there is an autograders directory "(.*?)"$/ do |rag|
#  @rag = rag
#end
#
#Given /^that there is a homeworks directory "(.*?)"$/ do |hw|
#  @hw = hw
#end
#
#Given(/^I have a homework "(.*?)"$/) do |hw_name|
#  expect(Dir).to exist("#{@hw}/#{hw_name}")
#end
#
## WHEN STEPS
#
#When(/^I check the autograders directory$/) do
#  expect(Dir).to exist(@rag)
#end
#
#When(/^I delete all the autograder log files$/) do
#  dir_path = Dir.getwd+"/#{@rag}/log"
#  FileUtils.rm_rf("#{dir_path}/.", secure: true)
#  autograder_logs = "#{@rag}/log/*"
#  expect(Dir[autograder_logs]).to be_empty
#end
#
#When(/^I check each homeworks directory$/) do
#  expect(Dir).to exist(@hw)
#  @homeworks = Dir.glob("#{@hw}/*").select { |f| File.directory? f }
#end
#

#
## THEN STEPS

#Then /^I should see a log directory "(.*?)" has (\d+) files$/ do |dir_name, num_files|
#  dir = @rag+'/log/'+dir_name
#  expect(Dir).to exist(dir)
#  expect(Dir[dir+"/*"].length).to have(8).items
#end
