require 'test_helper'

class TranslatorFlowTest < ActionDispatch::IntegrationTest
  test "can view a problem" do
    get '/problems/1'
    assert_response :success
    assert_select "h1", "First title"
  end

  test "can login via github" do
    get '/users/auth/github'
    assert_response :redirect
    follow_redirect!
    follow_redirect!
    assert_response :success
    assert controller.user_signed_in?
    assert_equal "translator", controller.current_user.name
  end
end
