require 'test_helper'
require 'csv'

class PullProblemsJobTest < ActiveJob::TestCase
  test "should update problem count and titles" do
    csv_string = CSV.generate do |csv|
      csv << [1, "Title of problem 1", 4.days.ago.to_i, 2.days.ago.to_i, 123]
      csv << [2, "Title of problem 2", 4.days.ago.to_i, 2.days.ago.to_i, 123]
      csv << [3, "Title of problem 3", 4.days.ago.to_i, 2.days.ago.to_i, 123]
      csv << [4, "Title of problem 4", 4.days.ago.to_i, 2.days.ago.to_i, 123]
      csv << [5, "Title of problem 5", 4.days.ago.to_i, 2.days.ago.to_i, 123]
    end
    stub = WebMock.stub_request(:get, "https://projecteuler.net/minimal=problems;csv").
        to_return(body: csv_string)
    problems(:two).update(pulled_at: 3.days.ago)
    problems(:three).update(pulled_at: 1.day.ago)

    assert_enqueued_jobs(4, only: PullProblemContentJob) do
      PullProblemsJob.perform_now
    end

    assert_requested stub
    assert_equal 5, Problem.count
    assert_equal "Title of problem 2", Problem.find(2).original_title
  end
end
