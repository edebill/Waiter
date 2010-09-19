source 'http://rubygems.org'

gem 'rails', '3.0.0'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg'
gem 'memcache-client', :require => 'memcache'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri', '1.4.1'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'
gem 'devise', '1.1.rc1'


group :test, :development do
  gem 'rspec-rails', '= 2.0.0.beta.20'
  gem 'shoulda'
  gem 'factory_girl_rails'
#  gem 'ruby-debug'
end

group :cucumber do
  gem 'capybara'           # better than webrat
  gem 'database_cleaner'   # clean database between tests
  gem 'cucumber-rails'
  gem 'cucumber'
  gem 'rspec-rails', '= 2.0.0.beta.20'
  gem 'spork'
#  gem 'linecache19'
#  gem 'launchy'            # can pop a browser with 'Then show me the page'
  gem 'factory_girl_rails'
#  gem 'ruby-debug'
end

# group :test do
#   gem 'webrat'
# end
