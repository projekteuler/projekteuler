require 'test_helper'

class PullProblemContentJobTest < ActiveJob::TestCase
  test "should update problem count and titles" do

    stub = WebMock.stub_request(:get, "https://projecteuler.net/minimal=3").
        to_return(body: "\n<p><a href=\"problem=5\">test</a></p>")

    PullProblemContentJob.perform_now problems(:three)

    assert_requested stub
    assert_equal '<p><a href="/problem=5">test</a></p>', Problem.find(3).original_content
    assert_in_delta Time.current, Problem.find(3).pulled_at, 5
  end
end
