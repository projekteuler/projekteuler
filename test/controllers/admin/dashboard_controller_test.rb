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

  test "should post new problem count" do
    post :update_problem_count, problem_count: 15
    assert_redirected_to controller: 'admin/dashboard', action: 'index'
    assert_equal 15, Problem.count
  end

end
