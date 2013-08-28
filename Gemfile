source 'http://rubygems.org'

if RUBY_VERSION =~ /1.9/
  Encoding.default_external = Encoding::UTF_8
  Encoding.default_internal = Encoding::UTF_8
end

# This is the list of all librairies we use in this project.

gem 'rails', '3.2.12'			# framework web

gem 'rest-client'
gem 'simple_xlsx_writer' 	# generate exel files with ruby
gem 'thin'								# ruby webserver
gem 'will_paginate' 			# pagination gem

gem 'jquery-rails'  			# jquery for rails
gem 'simple_form'   			# for convenient forms 

# Gems used only for assets.
group :assets do
  gem 'sass-rails',     '~> 3.2.5' # no need to care about those 
  gem 'coffee-rails',   '~> 3.2.2' # no need to care about those
  gem 'uglifier',       '>= 1.0.3' # no need to care about those
  gem 'bootstrap-sass'
end

group :development do
  gem 'annotate'  # to generate annotation on models
  gem 'rails-erd' # to generat Chronos Class diagram
end

group :development, :test do
  gem 'rspec-rails' # tests lib
  gem 'factory_girl_rails' # easier model manipulation in tests
  gem 'timecop'     # to fix time in tests
  gem 'guard-rspec' # for preloading of rspec (related to tests)
  gem 'guard-spork' # for preloading of guard (related to tests)
  gem "spork-rails" # for preloading rails
  gem 'spork'       # for preloading things
  
  gem 'sqlite3'     # much easier to setup than postgresql
end

group :test do
  gem 'turn', '0.8.2', :require => false
  gem 'webmock'
  gem 'email_spec'
  gem 'timecop'
  
  gem 'growl'       # prety printing of tests in console
  gem 'rb-fsevent'  # prety printing of tests in console
end

group :production do
	gem 'pg'     # postgres
	gem 'dalli'  # fast in-memory cache
end

