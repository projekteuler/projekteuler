require 'test_helper'

class TranslationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @update = {
        title: 'New title',
        content: 'This is the new content',
    }
    @incorrect = {
        title: '',
        content: ''
    }
  end

  test "should get new for translated problem" do
    get new_problem_translation_url(problem_id: 1)
    assert_response :success
  end

  test "should get new for untranslated problem" do
    get new_problem_translation_url(problem_id: 3)
    assert_response :success
  end

  test "should create translation anonymously" do
    assert_difference('Translation.count') do
      post problem_translations_url(problem_id: 1, translation: @update)
    end

    assert_redirected_to problem_path(id: 1)
  end

  test "should create translation with user" do
    login_translator
    assert_difference('Translation.count') do
      post problem_translations_url(problem_id: 1, translation: @update)
    end

    assert_redirected_to problem_path(id: 1)
    assert_equal users(:translator), Translation.last.author
  end

  test "should create and accept translation from admin" do
    login_admin
    assert_difference('Translation.count') do
      post problem_translations_url(problem_id: 1, translation: @update, accept: true)
    end

    assert_redirected_to problem_path(id: 1)
    assert_equal users(:admin), Translation.last.author
    assert_equal Problem.find(1).translation, Translation.last
  end

  test "should create but not accept translation from normal user" do
    login_translator
    assert_difference('Translation.count') do
      post problem_translations_url(problem_id: 1, translation: @update, accept: true)
    end

    assert_redirected_to problem_path(id: 1)
    assert_equal users(:translator), Translation.last.author
    assert_not_equal Problem.find(1).translation, Translation.last
  end

  test "should not create incorrect translation" do
    assert_no_difference('Translation.count') do
      post problem_translations_url(problem_id: 1, translation: @incorrect)
    end
  end
end
