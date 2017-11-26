require 'test_helper'

class Admin::TranslationsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    login
    @translation = translations(:translation_one)
  end
  test "should get index" do
    get admin_translations_url
    assert_response :success
    assert_not_nil assigns(:translations)
  end

  test "should show translation" do
    get admin_translation_url(id: @translation)
    assert_response :success
  end

end
