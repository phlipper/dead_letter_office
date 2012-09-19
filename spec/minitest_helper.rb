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
require File.expand_path("../dummy/config/environment", __FILE__)

require "minitest/autorun"
require "minitest/pride"
require "minitest/rails"
