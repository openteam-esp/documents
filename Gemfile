source :rubygems

group :assets do
  gem 'therubyracer'                                                      unless RUBY_PLATFORM =~ /freebsd/
  gem 'uglifier'
end

group :default do
  gem 'client_side_validations'
  gem 'compass-rails'
  gem 'curb'
  gem 'default_value_for'
  gem 'sso-auth'
  gem 'esp-views'
  gem 'esp-commons'
  gem 'formtastic',     '< 2.2.0'
  gem 'formtastic_datepicker-rails3x',              :git => 'git://github.com/kristianmandrup/formtastic_datepicker-rails3x.git'
  gem 'ancestry'
  gem 'has_enum'
  gem 'has_scope'
  gem 'has_searcher'
  gem 'inherited_resources'
  gem 'jquery-rails'
  gem 'kaminari'
  gem 'paperclip-elvfs'
  gem 'rails', '~> 3.2.12'
  gem 'russian'
  gem 'sass-rails'
  gem 'state_machine'
  gem 'sunspot_rails',   '>= 2.0.0.pre.120417'
end

group :development do
  gem 'annotate',        '~> 2.4.1.beta1',          :require => false
  gem 'brakeman'
  gem 'hirb',                                       :require => false
  gem 'rvm-capistrano'
  gem 'capistrano-ext'
  gem 'rails-erd'
  gem 'sunspot_solr',    '>= 2.0.0.pre.120417',     :require => false
end

group :production do
  gem 'pg'
end

group :test do
  gem 'fabrication',     '< 2.0.0',                 :require => false
  gem 'forgery'
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'libnotify'
  gem 'rb-inotify'
  gem 'rspec-rails'
  gem 'ryba'
  gem 'shoulda-matchers',                           :require => false
  gem 'spork',            '~> 0.9.0.rc9'
  gem 'sqlite3'
  gem 'sunspot_matchers',                           :require => false
end

