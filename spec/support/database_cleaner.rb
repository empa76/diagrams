RSpec.configure do |config|
  config.use_transactional_examples = false
  config.use_transactional_fixtures = false

  config.before :suite do
    DatabaseCleaner.clean_with :truncation
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each) do |example|
    if example.metadata[:js] || example.metadata[:type] == :feature
      DatabaseCleaner.strategy = :deletion
    else
      DatabaseCleaner.strategy = :transaction
      DatabaseCleaner.start
    end
  end

  config.after(:each) do
    DatabaseCleaner.clean
    ActiveRecord::Base.connection.close
  end
end
