require 'codacy-coverage'
require 'webmock/minitest'

Codacy::Reporter.start

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  WebMock.disable_net_connect!

  # Add more helper methods to be used by all tests here...
end


class ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def login_admin
    admin = users(:admin)
    sign_in admin
  end

  def login_translator
    translator = users(:translator)
    sign_in translator
  end

  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      provider: :github,
      uid: 'translator',
      name: 'translator'
  })
end