require 'test_helper'

class Admin::TranslationsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    login_admin
    @translation = translations(:translation_one)
    @translation_alternative = translations(:translation_two_alternative)
    @translation_outdated = translations(:translation_two_outdated)
    @translation_declined = translations(:translation_two_declined)
  end
  test "should get index" do
    get admin_translations_url
    assert_response :success
    assert_not_nil assigns(:translations)
  end

  test "should show current_translation" do
    get admin_translation_url(translation_id: @translation)
    assert_response :success
  end

  test "should show alternative_translation" do
    get admin_translation_url(translation_id: @translation_alternative)
    assert_response :success
  end

  test "should show outdated_translation" do
    get admin_translation_url(translation_id: @translation_outdated)
    assert_response :success
  end

  test "should show declined_translation" do
    get admin_translation_url(translation_id: @translation_declined)
    assert_response :success
  end

  test "should accept translation" do
    post admin_translation_accept_path(@translation_alternative)
    assert_redirected_to problem_path(2)
    assert_equal @translation_alternative, Problem.find(2).translation
  end

  test "should decline translation" do
    post admin_translation_decline_path(@translation_alternative)
    assert_redirected_to admin_translations_path
    assert Translation.find(@translation_alternative.id).declined?
  end
end
