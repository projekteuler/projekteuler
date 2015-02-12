class Translation < ActiveRecord::Base
  belongs_to :problem, inverse_of: :translations

  validates :title, :content, :problem_id, presence: true
  validate :title_is_unique_among_other_problems

  self.per_page = 50

  def title_is_unique_among_other_problems
    Problem.where.not(id: problem_id).each do |problem|
      if problem.is_translated? and problem.title == title
        errors.add(:title, :taken)
        break
      end
    end
  end
end
