require "simplecov"
SimpleCov.add_filter "spec"
SimpleCov.command_name "MiniTest"
SimpleCov.start "rails"

ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../dummy/config/environment", __FILE__)
require "minitest/autorun"
require "minitest/pride"

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }
