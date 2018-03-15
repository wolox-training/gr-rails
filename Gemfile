source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.5'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

gem 'dotenv-rails', groups: [:development, :test]

#Active Admin is a Ruby on Rails framework for creating elegant backends for website administration.
gem 'activeadmin'

# Devise is a flexible authentication solution for Rails based on Warden
gem 'devise'

#Simple, efficient background processing for Ruby.
gem 'sidekiq'

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# This gem generates fake data.
gem 'faker', git: 'https://github.com/stympy/faker.git', branch: 'master'
# Automatic Ruby code style checking tool. Aims to enforce the community-driven Ruby Style Guide.
gem 'rubocop', '~> 0.52.1'

#ActiveModelSerializers brings convention over configuration to your JSON generation.
gem 'active_model_serializers', '~> 0.10.0', require: true

#Wor::Paginate is a gem for Rails that simplifies pagination
gem 'wor-paginate'

#Simple, secure token based authentication for Rails.
gem 'devise_token_auth'


# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  # factory_bot supports multiple factories for the same class
  gem 'factory_bot_rails', '~> 4.0'
  # rspec-rails is a testing framework for Rails 3.x, 4.x and 5.0.
  gem 'rspec-rails', '~> 3.7'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # DB Cleaner is a set of strategies for cleaning your database in Ruby.
  gem 'database_cleaner'
end
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
