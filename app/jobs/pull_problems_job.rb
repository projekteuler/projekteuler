require 'csv'
require 'open-uri'

class PullProblemsJob < ApplicationJob
  queue_as :default

  PULL_URL = "https://projecteuler.net/minimal=problems;csv"

  def perform
    csv = CSV.parse(URI.open(PULL_URL), headers: :first_row)
    csv.each do |row|
      id = row["ID"].to_i
      last_updated = Time.at(row["Updated"].to_i)
      problem = Problem.where(id: id).first_or_create!
      if problem.pulled_at.nil? or problem.pulled_at < last_updated
        original_title = row["Description"]
        problem.update(original_title: original_title)
        # Don't update pulled_at yet until we also successfully pulled the original_content
        PullProblemContentJob.perform_later problem
      end
    end
  end
end
