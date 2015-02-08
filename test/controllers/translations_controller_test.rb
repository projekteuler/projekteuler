require 'test_helper'

class TranslationsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @translation = translations(:translation_one)
    @update = {
        title: 'New title',
        content: 'This is the new content',
    }
    @incorrect = {
        title: '',
        content: ''
    }
    @admin = admins(:admin)
  end

  test "should get index" do
    sign_in @admin
    get :index
    assert_response :success
    assert_not_nil assigns(:translations)
  end

  test "should get new" do
    get :new, problem_id: 1
    assert_response :success
  end

  test "should create translation" do
    assert_difference('Translation.count') do
      post :create, problem_id: 1, translation: @update
    end

    assert_redirected_to problem_path(id: 1)
  end

  test "should not create incorrect translation" do
    assert_no_difference('Translation.count') do
      post :create, problem_id: 1, translation: @incorrect
    end
  end

  test "should show translation" do
    sign_in @admin
    get :show, id: @translation
    assert_response :success
  end
end
