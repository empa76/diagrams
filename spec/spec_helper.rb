require 'simplecov'
SimpleCov.start 'rails' do
  add_group 'Decorators', 'app/decorators'
  add_group 'Admin', 'app/admin'
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
