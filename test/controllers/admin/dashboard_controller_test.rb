require 'test_helper'

class Admin::DashboardControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  include ActiveJob::TestHelper

  setup do
  end

  test "should not get index if not admin" do
    login_translator
    get admin_dashboard_index_url
    assert_redirected_to root_url
  end

  test "should get index" do
    login_admin
    get admin_dashboard_index_url
    assert_response :success
  end

  test "should update problems" do
    WebMock.stub_request(:get, "https://projecteuler.net/minimal=problems;csv").to_return(body: "")

    login_admin
    assert_enqueued_jobs 1, only: PullProblemsJob do
      post admin_dashboard_pull_problems_url
    end
    assert_redirected_to admin_dashboard_index_url
  end

end
