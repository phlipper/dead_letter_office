source "http://rubygems.org"

# Declare your gem's dependencies in dead_letter_office.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# jquery-rails is used by the dummy application
gem "jquery-rails"
gem "sass-rails"

platforms :jruby do
  gem "activerecord-jdbc-adapter", require: false
end

group :test do

  platforms :ruby do
    gem "mysql2"
    gem "pg"
    gem "sqlite3"
  end

  platforms :jruby do
    gem "activerecord-jdbcmysql-adapter", require: false
    gem "activerecord-jdbcpostgresql-adapter", require: false
    gem "activerecord-jdbcsqlite3-adapter", require: false
  end
end
