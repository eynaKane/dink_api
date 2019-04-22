ENV['RAILS_ENV'] = 'test'
require './config/environment'

require 'database_cleaner'
require 'minitest/spec'
require 'rspec/rails'
require 'spinach/rspec/mocks'

# require 'database_cleaner'
# DatabaseCleaner.strategy = :truncation
#
# Spinach.hooks.before_scenario{ DatabaseCleaner.clean }
#
# Spinach.config.save_and_open_page_on_failure = true
