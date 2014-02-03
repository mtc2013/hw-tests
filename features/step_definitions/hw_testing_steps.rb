Given(/^I have a homework "(.*?)" in the repo$/) do |hw_name|
  expect(Dir).to exist(hw_name)
end

Given /I have AutoGrader setup/ do
  Dir.chdir('rag') do
    puts `cucumber`
  end
end

When(/^I run the AutoGrader on this homework$/) do
  test_subject_path = '../ruby-intro/solutions/lib/part1.rb'
  spec_path = '../ruby-intro/autograder/part1_spec.rb'
  cli_string = "./grade #{test_subject_path} #{spec_path}"

  Dir.chdir('rag') do
    ENV['BUNDLE_GEMFILE']='Gemfile'
    output = `#{cli_string}`
    puts output
  end
end


Then(/^I should see no runtime errors$/) do
  pending # express the regexp above with the code you wish you had
end
