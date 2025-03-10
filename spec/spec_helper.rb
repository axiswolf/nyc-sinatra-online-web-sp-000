ENV["SINATRA_ENV"] = "test"

require_relative '../config/environment'
require 'rack/test'
require 'capybara/rspec'
require 'capybara/dsl'


#if defined?(ActiveRecord::Migrator) && ActiveRecord::Migrator.needs_migration?
if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise 'Migrations are pending run `rake db:migrate SINATRA_ENV=test` to resolve the issue.'
end

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.include Rack::Test::Methods
  config.include Capybara::DSL


  config.order = 'default'
end


ActiveRecord::Base.logger.level = 1

def app
  Rack::Builder.parse_file('config.ru').first
end

Capybara.app = app
