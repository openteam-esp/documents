require 'rubygems'

ENV["RAILS_ENV"] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)

require 'rspec/rails'
require 'cancan/matchers'
require 'fabrication'
require 'shoulda-matchers'
require 'sunspot_matchers'

Dir[Rails.root.join("spec/support/helpers/*.rb")].each {|f| require f}

RSpec.configure do |config|
  config.include DocumentsSpecHelper
  config.include SunspotMatchers

  config.mock_with :rspec

  config.use_transactional_fixtures = true

  config.before do
    Sunspot.session = SunspotMatchers::SunspotSessionSpy.new(Sunspot.session)
  end

  config.before do
    stub_message_maker
  end
end
