require 'test_helper'

class ProblemTest < ActiveSupport::TestCase
  test "should not save problem without title" do
    problem = Problem.new(content: 'This is some content')
    assert_not problem.save
  end

  test "should not save problem without content" do
    problem = Problem.new(title: 'Problem title')
    assert_not problem.save
  end

  test "should not save problem with duplicate title" do
    problem = Problem.new(
        title: problems(:one).title,
        content: 'This is some content'
    )
    assert_not problem.save
  end

  test "should save correct problem" do
    problem = Problem.new(
        title: 'A unique title',
        content: 'Some content'
    )
    assert problem.save
  end

  test "should have correct original url" do
    first = Problem.first
    assert_equal "https://projecteuler.net/problem=#{first.id}", first.original_url
  end
end
