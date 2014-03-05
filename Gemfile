source 'http://rubygems.org'
ruby "2.1.0"

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
gem 'validates_email_format_of'
gem 'turbolinks'

# Gems used only for assets.
group :assets do
  gem 'sass-rails',     '~> 3.2.5'
  gem 'coffee-rails',   '~> 3.2.2'
  gem 'uglifier',       '>= 1.0.3'
  gem 'bootstrap-sass', '~> 2.3'
end

group :development do
  gem 'annotate'  # to generate annotation on models
  gem 'rails-erd' # to generat Chronos Class diagram
end

group :development, :test do
  gem 'rspec-rails' # tests lib
  gem 'sqlite3'     # much easier to setup than postgresql
end

group :test do
  gem 'webmock'
  gem 'email_spec'
end

group :production do
	gem 'pg'     # postgres
	gem 'dalli'  # fast in-memory cache
end

