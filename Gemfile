source :rubygems

gem 'client_side_validations'
gem 'configliere'
gem 'default_value_for'
gem 'el_vfs_client'
gem 'formtastic'
gem 'formtastic_datepicker-rails3x',              :git => 'git://github.com/kristianmandrup/formtastic_datepicker-rails3x.git'
gem 'has_enum'
gem 'has_scope'
gem 'has_searcher'
gem 'inherited_resources'
gem 'jquery-rails'
gem 'kaminari'
gem 'rails',                                      :require => false
gem 'russian'
gem 'sass-rails'
gem 'state_machine'
gem 'sunspot_rails'

group :assets do
  gem 'compass',                '~> 0.12.alpha.2'
  gem 'uglifier'
end

group :development do
  gem 'annotate',               '~> 2.4.1.beta1', :require => false
  gem 'hirb',                                     :require => false
  gem 'rails-erd'
  gem 'itslog'
  gem 'sunspot_solr',                             :require => false
  gem 'therubyracer'                                                      unless RUBY_PLATFORM =~ /freebsd/
end

group :production do
  gem 'hoptoad_notifier'
  gem 'pg'
  gem 'unicorn',                                  :require => false       unless ENV['SHARED_DATABASE_URL']
end

group :test do
  gem 'fabrication',                              :require => false
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'libnotify'
  gem 'rb-inotify'
  gem 'rspec-rails'
  gem 'shoulda-matchers',                         :require => false
  gem 'spork',                  '~> 0.9.0.rc9'
  gem 'sqlite3'
  gem 'sunspot_matchers',                         :require => false
end

