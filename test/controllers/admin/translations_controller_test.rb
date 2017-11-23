require 'test_helper'

class Admin::TranslationsControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  setup do
    login
    @translation = translations(:translation_one)
  end
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:translations)
  end

  test "should show translation" do
    get :show, params: { id: @translation }
    assert_response :success
  end

end
