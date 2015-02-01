require 'test_helper'

class TranslationsControllerTest < ActionController::TestCase
  setup do
    @translation = translations(:translation_one)
    @update = {
        title: 'New title',
        content: 'This is the new content',
    }
  end

  test "should get index" do
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

  test "should show translation" do
    get :show, id: @translation
    assert_response :success
  end
end
