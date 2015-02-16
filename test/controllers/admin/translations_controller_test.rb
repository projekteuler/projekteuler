require 'test_helper'

class Admin::TranslationsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

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
    get :show, id: @translation
    assert_response :success
  end

end