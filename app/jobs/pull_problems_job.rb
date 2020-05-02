require 'csv'
require 'open-uri'

class PullProblemsJob < ApplicationJob
  queue_as :default

  PULL_URL = "https://projecteuler.net/minimal=problems;csv"

  def perform
    csv = CSV.parse(URI.open(PULL_URL), headers: [:id, :title, :date_published, :date_last_updated, :solved_by])
    csv.each do |row|
      id = row[:id].to_i
      last_updated = Time.at(row[:date_last_updated].to_i)
      problem = Problem.where(id: id).first_or_create!
      if problem.pulled_at.nil? or problem.pulled_at < last_updated
        original_title = row[:title]
        problem.update(original_title: original_title)
        # Don't update pulled_at yet until we also successfully pulled the original_content
        PullProblemContentJob.perform_later problem
      end
    end
  end
end
