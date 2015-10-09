ENV['RAILS_ENV'] ||= 'test'
require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)

require 'rake'
require 'rspec/rails'
require 'database_cleaner'
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.include Rails.application.routes.url_helpers
  config.include FactoryGirl::Syntax::Methods
  config.include Requests::JsonHelpers, type: :request
  config.order = 'random'
  config.infer_spec_type_from_file_location!
end
