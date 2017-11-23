require 'test_helper'

class ProblemsControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, params: { id: 1 }
    assert_response :success
  end

  test "should get untranslated problem" do
    get :show, params: { id: 3 }
    assert_response :success
  end

end
