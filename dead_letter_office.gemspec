$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "dead_letter_office/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "dead_letter_office"
  s.version     = DeadLetterOffice::VERSION
  s.authors     = ["Phil Cohen"]
  s.email       = ["github@phlippers.net"]
  s.homepage    = "http://phlippers.net/dead_letter_office"
  s.summary     = "This project implements a Dead letter office for your Rails 3 application."
  s.description = "Undeliverable emails (deliveries which raise exceptions) will be logged to the database and can be viewed via a mountable web interface."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 3.2.6"
  s.add_dependency "sass-rails", "~> 3.2.5"

  s.add_development_dependency "capybara"
  s.add_development_dependency "guard-minitest"
  s.add_development_dependency "minitest-rails"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "simplecov"
end
