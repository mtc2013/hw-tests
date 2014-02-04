require 'open3'

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

    @test_output, @test_errors, @test_status = Open3.capture3(
        { 'BUNDLE_GEMFILE' => 'Gemfile' }, cli_string, :chdir => './rag'
    )

end

Then(/^I should see no runtime errors$/) do
  expect(@test_errors).to eq ''
end

And(/^I should see that the process succeeded$/) do
  expect(@test_status).to be_success
end