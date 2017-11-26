require 'test_helper'

class Admin::DashboardControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    login
  end

  test "should get index" do
    get admin_dashboard_index_url
    assert_response :success
  end

  test "should post new problem count" do
    post admin_dashboard_update_problem_count_url(problem_count: 15)
    assert_redirected_to admin_dashboard_index_url
    assert_equal 15, Problem.count
  end

  test "should fail incorrect problem count" do
    post admin_dashboard_update_problem_count_url(problem_count: 2)
    assert_redirected_to admin_dashboard_index_url
    assert_equal 3, Problem.count
  end

end
