require 'test_helper'

class ProblemTest < ActiveSupport::TestCase
  test "should save correct problem" do
    problem = Problem.new
    assert problem.save
  end

  test "is_translated? should return false for missing translation" do
    assert_not problems(:three).is_translated?
  end

  test "is_translated? should return true for existing translation" do
    assert problems(:one).is_translated?
  end
end
