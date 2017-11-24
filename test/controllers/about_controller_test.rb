require 'test_helper'

class AboutControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get about_index_url
    assert_response :success
  end

  test "should get info" do
    get about_info_url
    assert_response :success
  end

  test "should get copyright" do
    get about_copyright_url
    assert_response :success
  end

  test "should get legal" do
    get about_legal_url
    assert_response :success
  end

  test "should get roman_numerals" do
    get about_roman_numerals_url
    assert_response :success
  end

end
