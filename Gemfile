source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "~> 3.0.0"

gem "rails", "~> 6.1.5.1"
gem "pg", ">= 0.18", "< 2.0"
# gem 'sqlite3'
# gem "mysql2", "~> 0.5"

gem "puma", "~> 5.0"
gem "jbuilder", "~> 2.7"
gem "bcrypt", "~> 3.1.7"
gem "bootsnap", ">= 1.4.2", require: false
gem "rack-cors"
gem "jwt", "~> 2.2", ">= 2.2.2"
gem "cloudinary", "~> 1.17", ">= 1.17.1"
gem "acts_as_votable", "~> 0.12.1"

group :development, :test do
  gem "rspec-rails", "~> 4.0", ">= 4.0.1"
  gem "shoulda-matchers", "~> 4.4", ">= 4.4.1"
  gem "factory_bot_rails", "~> 6.1"
  gem "guard-rspec", "~> 4.7", ">= 4.7.3"
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "standardrb", "~> 1.0"
end

group :development do
  gem "listen", "~> 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
