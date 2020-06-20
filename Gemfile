# frozen_string_literal: true

source 'https://rubygems.org'

ruby '2.6.1'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'dry-transaction'
gem 'dry-validation'
gem 'fast_jsonapi'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.12'
gem 'rails', '~> 5.2.4.3'

group :development, :test do
  gem 'bullet'
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'faker', git: 'https://github.com/stympy/faker.git', branch: 'master'
  gem 'mry'
  gem 'pry'
  gem 'rspec-rails'
  gem 'rubocop-faker'
  gem 'simplecov', require: false
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
