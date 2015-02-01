require 'test_helper'

class ProblemsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, id: 1
    assert_response :success
  end

  test "should get untranslated problem" do
    get :show, id: 3
    assert_response :success
  end

end
