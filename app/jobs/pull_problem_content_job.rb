require 'open-uri'

class PullProblemContentJob < ApplicationJob
  queue_as :default

  def perform(problem)
    html = URI.open("https://projecteuler.net/minimal=#{problem.id}").read
    html.strip!

    # Linked problems
    html.gsub!('<a href="problem=', '<a href="/problem=')
    # Linked about pages
    html.gsub!('<a href="about=', '<a href="/about=')
    # Linked txt resources
    html.gsub!('<a href="project/resources/', '<a href="https://projecteuler.net/project/resources/')
    # Included images
    html.gsub!('<img src="project/images/', '<img src="https://projecteuler.net/project/images/')

    problem.update(original_content: html, pulled_at: Time.current())
  end
end
