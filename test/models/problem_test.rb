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

  test "should have correct original url" do
    assert_equal "https://projecteuler.net/problem=1", problems(:one).original_url
  end

  test "should allow for problem count updating" do
    Problem.update_count(10)
    assert_not Problem.where(id: 0).exists?
    (1..10).each do |i|
      assert Problem.where(id: i).exists?
    end
    assert_equal "First title", Problem.find(1).title
  end

  test "should not allow decreasing problem count update" do

    assert_raises ArgumentError do
      Problem.update_count(1)
    end
    assert_equal 3, Problem.count()
  end
end
