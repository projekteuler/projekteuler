require 'test_helper'

class Admin::DashboardControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    login
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
