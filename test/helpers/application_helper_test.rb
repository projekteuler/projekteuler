require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "bootstrap classes for flash should return correct values" do
    assert_equal "alert-danger", bootstrap_class_for(:error)
    assert_equal "alert-success", bootstrap_class_for(:success)
  end

  test "bootstrap flash messages should work" do
    flash[:error] = "Error"
    assert_equal "<div class=\"alert alert-danger alert-dismissible\" role=\"alert\">Error<button class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button></div>", flash_messages
  end
end
