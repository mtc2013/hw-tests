require 'open3'

Given(/^I have a homework "(.*?)" in the repo$/) do |hw_name|
  expect(Dir).to exist(hw_name)
end

Given /I have AutoGrader setup/ do
  cli_string = 'cucumber'
  ENV['BUNDLE_GEMFILE']='Gemfile'
  puts 'Running cucumber and rspec tests on RAG....'
  Dir.chdir('rag') do
    @test_output, @test_errors, @test_status = Open3.capture3(cli_string)
  end

  expect(@test_status).to be_success
end

When(/^I run the AutoGrader on this homework$/) do
  test_subject_path = '../ruby-intro/solutions/lib/part1.rb'
  spec_path = '../ruby-intro/autograder/part1_spec.rb'
  cli_string = "./grade #{test_subject_path} #{spec_path}"
  ENV['BUNDLE_GEMFILE']='Gemfile'

  Dir.chdir('rag') do
    @test_output, @test_errors, @test_status = Open3.capture3(cli_string)
  end
end

Then(/^I should see no runtime errors$/) do
  expect(@test_status).to be_success
end

Then /^I should see test results$/ do
  # for debugging
  puts @test_output
  puts @test_errors
  puts @test_status
end
