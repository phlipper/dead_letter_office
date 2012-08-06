if RUBY_ENGINE == "ruby"
  begin
    require "simplecov"
    SimpleCov.add_filter "spec"
    SimpleCov.command_name "MiniTest"
    SimpleCov.start "rails"
  rescue LoadError
    warn "unable to load SimpleCov"
  end
end

ENV["RAILS_ENV"] = "test"
require File.expand_path('../dummy/config/environment', __FILE__)

require "minitest/autorun"
require "minitest/pride"
require "minitest/rails"

# Uncomment if you want Capybara in accceptance/integration tests
# require "minitest/rails/capybara"

class MiniTest::Rails::ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

# Do you want all existing Rails tests to use MiniTest::Rails?
# Comment out the following and either:
# A) Change the require on the existing tests to `require "minitest_helper"`
# B) Require this file's code in test_helper.rb

MiniTest::Rails.override_testunit!
