source 'https://rubygems.org'

# Use Puma as the app server
gem 'puma'

gem 'sass-rails'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.15'

gem 'jsonapi-resources', github: 'cerebris/jsonapi-resources'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

group :development, :test do
  gem 'better_errors'
  gem 'pry-rails'
  gem 'pry-doc'
  gem 'pry-remote'
  gem 'pry-nav'

  gem 'guard-rspec', require: false
  gem 'guard-bundler', require: false
  gem 'terminal-notifier-guard'
end

group :development do
  gem 'listen', '~> 3.0.5'
end

group :test do
  gem 'capybara'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'shoulda-matchers'
  gem 'database_cleaner'
  gem 'forgery'
  gem 'json-schema-rspec'
  gem 'simplecov', require: false
end
