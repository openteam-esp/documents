require 'rubygems'
require 'spork'

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'

  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'

  require 'shoulda-matchers'
  require 'sunspot_matchers'

  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    config.include SunspotMatchers

    config.mock_with :rspec

    config.use_transactional_fixtures = true

    config.before do
      Sunspot.session = SunspotMatchers::SunspotSessionSpy.new(Sunspot.session)
    end
  end
end

Spork.each_run do
end


