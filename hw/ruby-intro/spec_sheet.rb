module Rubyintro

  def self.mapping
    [   {test_title: 'specs vs solution', test_subject: 'solutions/lib/part1.rb',
         spec: 'autograder/part1_spec.rb', expected_result: 'Score out of 100: 100'},
        {test_title: 'specs vs skeleton', test_subject: 'public/lib/part1.rb',
         spec: 'autograder/part1_spec.rb', expected_result: 'Score out of 100: 5'}
    ]
  end

end