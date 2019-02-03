require 'coveralls'
Coveralls.wear!('rails')

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def login_admin
    admin = users(:admin)
    sign_in admin
  end

  def login_translator
    translator = users(:translator)
    sign_in translator
  end
end
