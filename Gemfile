# frozen_string_literal: true

# rubocop:disable Layout/EmptyLines, Lint/RedundantCopDisableDirective

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "~> 3.1.2"

gem "rails"
gem "pg"

gem "puma"
gem "jbuilder"
gem "bcrypt"
gem "bootsnap", require: false
gem "rack-cors"
gem "jwt"
gem "cloudinary"
gem "acts_as_votable"

gem 'omniauth-google-oauth2'

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "rspec-rails"
  gem "shoulda-matchers"
  gem "factory_bot_rails"
  gem "guard-rspec"
  gem "standardrb"
end

group :development do
  gem "spring"
  gem "spring-watcher-listen"
end
