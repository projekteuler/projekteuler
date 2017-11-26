require 'test_helper'

class ProblemsControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    get problems_url
    assert_response :success
  end

  test "should get show" do
    get problem_url(id: 1)
    assert_response :success
  end

  test "should get untranslated problem" do
    get problem_url(id: 3)
    assert_response :success
  end

  test "should redirect to correct problem" do
    get '/problem=2'
    assert_redirected_to problem_path(id: 2)
  end

end
